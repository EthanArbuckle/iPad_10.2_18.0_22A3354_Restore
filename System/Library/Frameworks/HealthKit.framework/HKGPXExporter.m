@implementation HKGPXExporter

- (HKGPXExporter)initWithURL:(id)a3 route:(id)a4
{
  id v7;
  id v8;
  HKGPXExporter *v9;
  HKGPXExporter *v10;
  NSISO8601DateFormatter *v11;
  NSISO8601DateFormatter *isoFormatter;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKGPXExporter;
  v9 = -[HKGPXExporter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    v10->_isFinished = 0;
    objc_storeStrong((id *)&v10->_route, a4);
    v11 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E0CB36A8]);
    isoFormatter = v10->_isoFormatter;
    v10->_isoFormatter = v11;

  }
  return v10;
}

- (BOOL)appendLocations:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  NSFileHandle *v19;
  NSFileHandle *fileHandle;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_isFinished)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 100, CFSTR("Export has already finished."));
LABEL_3:
    v7 = 0;
    goto LABEL_16;
  }
  if (!self->_fileHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_URL, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0CB2AD8];
    v28[0] = *MEMORY[0x1E0CB2AB8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createFileAtPath:contents:attributes:", v17, 0, v18);

    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", self->_URL, a4);
    v19 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
    fileHandle = self->_fileHandle;
    self->_fileHandle = v19;

    if (!self->_fileHandle || !-[HKGPXExporter _appendGPXHeaderWithError:](self, "_appendGPXHeaderWithError:", a4))
      goto LABEL_3;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v21[0] = v12;
        v21[1] = 3221225472;
        v21[2] = __39__HKGPXExporter_appendLocations_error___block_invoke;
        v21[3] = &unk_1E37F51D0;
        v21[4] = self;
        v21[5] = v14;
        if (!HKWithAutoreleasePool(a4, v21))
        {
          v7 = 0;
          goto LABEL_15;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_15:

LABEL_16:
  return v7;
}

uint64_t __39__HKGPXExporter_appendLocations_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_trackpointEntryForLocation:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "_appendString:error:", v4, a2);

  return v5;
}

- (BOOL)finishWithError:(id *)a3
{
  void *v4;
  const __CFString *v5;
  BOOL v7;

  if (!self->_fileHandle)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = CFSTR("Export has not begun (try calling -[appendLocations:error:] first).");
    goto LABEL_5;
  }
  if (self->_isFinished)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = CFSTR("Export has already finished.");
LABEL_5:
    objc_msgSend(v4, "hk_assignError:code:description:", a3, 100, v5);
    return 0;
  }
  v7 = -[HKGPXExporter _appendString:error:](self, "_appendString:error:", CFSTR("    </trkseg>\n  </trk>\n</gpx>"), a3);
  -[NSFileHandle closeFile](self->_fileHandle, "closeFile");
  self->_isFinished = 1;
  return v7;
}

+ (id)fileNameForRoute:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[HKGPXExporter _displayNameForRoute:](HKGPXExporter, "_displayNameForRoute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.gpx"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_displayNameForRoute:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x1E0C99D48];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996D8]);
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "components:fromDate:", 124, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hour");
  v10 = CFSTR("am");
  if (v9 > 11)
    v10 = CFSTR("pm");
  v11 = v10;
  if (objc_msgSend(v8, "hour") && objc_msgSend(v8, "hour") != 12)
    v12 = objc_msgSend(v8, "hour") % 12;
  else
    v12 = 12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%02ld-%02ld %ld:%02ld%@"), objc_msgSend(v8, "year"), objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), v12, objc_msgSend(v8, "minute"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Route %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_trackpointEntryForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSISO8601DateFormatter *isoFormatter;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "altitude");
  v11 = v10;
  isoFormatter = self->_isoFormatter;
  objc_msgSend(v4, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSISO8601DateFormatter stringFromDate:](isoFormatter, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speed");
  v16 = v15;
  objc_msgSend(v4, "course");
  v18 = v17;
  objc_msgSend(v4, "horizontalAccuracy");
  v20 = v19;
  objc_msgSend(v4, "verticalAccuracy");
  v22 = v21;

  v23 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("      <trkpt lon=\"%f\" lat=\"%f\"><ele>%f</ele><time>%@</time><extensions><speed>%f</speed><course>%f</course><hAcc>%f</hAcc><vAcc>%f</vAcc></extensions></trkpt>\n"), v8, v6, v11, v14, v16, v18, v20, v22);
  return v23;
}

- (BOOL)_appendGPXHeaderWithError:(id *)a3
{
  NSISO8601DateFormatter *isoFormatter;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  isoFormatter = self->_isoFormatter;
  v6 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[NSISO8601DateFormatter stringFromDate:](isoFormatter, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[HKGPXExporter _displayNameForRoute:](HKGPXExporter, "_displayNameForRoute:", self->_route);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<gpx version=\"1.1\" creator=\"%@\" xmlns=\"%@\" xmlns:xsi=\"%@\" xsi:schemaLocation=\"%@ %@\">\n  <metadata>\n    <time>%@</time>\n  </metadata>\n  <trk>\n    <name>%@</name>\n    <trkseg>\n"), CFSTR("Apple Health Export"), CFSTR("http://www.topografix.com/GPX/1/1"), CFSTR("http://www.w3.org/2001/XMLSchema-instance"), CFSTR("http://www.topografix.com/GPX/1/1"), CFSTR("http://www.topografix.com/GPX/1/1/gpx.xsd"), v7, v9);

  LOBYTE(a3) = -[HKGPXExporter _appendString:error:](self, "_appendString:error:", v10, a3);
  return (char)a3;
}

- (BOOL)_appendString:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[NSFileHandle writeData:error:](self->_fileHandle, "writeData:error:", v6, a4);

  return (char)a4;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_isoFormatter, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
