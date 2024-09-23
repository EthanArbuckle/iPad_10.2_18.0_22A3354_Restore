@implementation NSString(AVTExtension)

- (void)avt_diffAgainst:()AVTExtension suppressCommonLines:completionHandler:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(id, _QWORD, void *);
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  _QWORD v35[7];

  v35[5] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v24 = a5;
  NSTemporaryDirectory();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "stringByAppendingString:", CFSTR("-old.shader"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByAppendingPathComponent:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "stringByAppendingString:", CFSTR("-new.shader"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "writeToFile:atomically:encoding:error:", v25, 1, 4, 0);
  objc_msgSend(v26, "writeToFile:atomically:encoding:error:", v11, 1, 4, 0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 130;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __80__NSString_AVTExtension__avt_diffAgainst_suppressCommonLines_completionHandler___block_invoke;
  v29[3] = &unk_1EA61ED80;
  v29[4] = &v30;
  v12 = (void *)MEMORY[0x1DF0D6F78](v29);
  objc_msgSend(a1, "enumerateLinesUsingBlock:", v12);
  objc_msgSend(v26, "enumerateLinesUsingBlock:", v12);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--width=%llu"), v31[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0CB3958]);
  objc_msgSend(v16, "setLaunchPath:", CFSTR("/usr/bin/sdiff"));
  objc_msgSend(v16, "setStandardOutput:", v14);
  objc_msgSend(v16, "setStandardError:", v15);
  if (a4)
  {
    v35[0] = CFSTR("--expand-tabs");
    v35[1] = CFSTR("--suppress-common-lines");
    v35[2] = v13;
    v35[3] = v25;
    v35[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  }
  else
  {
    v34[0] = CFSTR("--expand-tabs");
    v34[1] = v13;
    v34[2] = v25;
    v34[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setArguments:", v17);

  objc_msgSend(v16, "launch");
  objc_msgSend(v16, "waitUntilExit");
  objc_msgSend(v14, "fileHandleForReading");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "readDataToEndOfFile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v19, 4);
  objc_msgSend(v15, "fileHandleForReading");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "readDataToEndOfFile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "length"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v22, 4);
    NSLog(CFSTR("⚠️ %@"), v23);
    v24[2](v24, 0, v23);

  }
  else
  {
    ((void (**)(id, void *, void *))v24)[2](v24, v20, 0);
  }

  _Block_object_dispose(&v30, 8);
}

@end
