@implementation AVMetadataItem(MIOExtensions)

+ (id)dictionaryRepresentationForMetadataFormatDescription:()MIOExtensions
{
  uint64_t MediaSubType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  MediaSubType = CMFormatDescriptionGetMediaSubType(desc);
  -[__CFDictionary objectForKeyedSubscript:](CMFormatDescriptionGetExtensions(desc), "objectForKeyedSubscript:", CFSTR("MetadataKeyTable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", MediaSubType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("formatType"));

  if (v6)
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("metadataKeys"));

  return v7;
}

+ (CMMetadataFormatDescriptionRef)metadataFormatDescriptionFromDictionary:()MIOExtensions
{
  id v3;
  void *v4;
  CMMetadataFormatType v5;
  const __CFArray *v6;
  OSStatus v7;
  NSObject *v8;
  CMMetadataFormatDescriptionRef v9;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  uint8_t buf[4];
  OSStatus v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("formatType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("metadataKeys"));
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  formatDescriptionOut = 0;
  v7 = CMMetadataFormatDescriptionCreateWithKeys((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, v6, &formatDescriptionOut);
  if (v7)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v7;
      _os_log_impl(&dword_210675000, v8, OS_LOG_TYPE_ERROR, "Cannot create metadata format description (err: %d).", buf, 8u);
    }

    v9 = 0;
  }
  else
  {
    v9 = formatDescriptionOut;
  }

  return v9;
}

+ (CMMetadataFormatDescriptionRef)createMIOMetadataAttachmentsFormatDescription
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFArray *v7;
  OSStatus v8;
  NSObject *v9;
  CMMetadataFormatDescriptionRef v10;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  uint8_t buf[4];
  OSStatus v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  +[MIOVersion versionZero](MIOVersion, "versionZero");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *MEMORY[0x24BDC0C50];
  v17[0] = *MEMORY[0x24BDC0C60];
  v2 = v17[0];
  v17[1] = v3;
  v4 = *MEMORY[0x24BDC0C08];
  v18[0] = v1;
  v18[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v15[0] = v2;
  v15[1] = v3;
  v16[0] = CFSTR("mdta/com.apple.stream_sample_attachments");
  v16[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  formatDescriptionOut = 0;
  v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x6D656278u, v7, &formatDescriptionOut);
  if (v8)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v8;
      _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "Cannot create metadata attachments format description (err: %d).", buf, 8u);
    }

    v10 = 0;
  }
  else
  {
    v10 = formatDescriptionOut;
  }

  return v10;
}

+ (CMMetadataFormatDescriptionRef)createMIOTimeRangeMetadataStreamFormatDescription
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  OSStatus v8;
  NSObject *v9;
  CMMetadataFormatDescriptionRef v10;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  uint8_t buf[4];
  OSStatus v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BDC0C50];
  v19[0] = *MEMORY[0x24BDC0C60];
  v1 = v19[0];
  v19[1] = v2;
  v3 = *MEMORY[0x24BDC0C20];
  v20[0] = CFSTR("mdta/com.apple.stream_time_range_start");
  v20[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v4);

  v17[0] = v1;
  v17[1] = v2;
  v18[0] = CFSTR("mdta/com.apple.stream_time_range_end");
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);

  v15[0] = v1;
  v15[1] = v2;
  v6 = *MEMORY[0x24BDC0C08];
  v16[0] = CFSTR("mdta/com.apple.stream_time_code");
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v7);

  formatDescriptionOut = 0;
  v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x6D656278u, (CFArrayRef)v0, &formatDescriptionOut);
  if (v8)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v8;
      _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "Cannot create time range metadata stream format description (err: %d).", buf, 8u);
    }

    v10 = 0;
  }
  else
  {
    v10 = formatDescriptionOut;
  }

  return v10;
}

+ (CMMetadataFormatDescriptionRef)createMIOMetadataStreamFormatDescription
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFArray *v7;
  OSStatus v8;
  NSObject *v9;
  CMMetadataFormatDescriptionRef v10;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  uint8_t buf[4];
  OSStatus v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  +[MIOVersion versionZero](MIOVersion, "versionZero");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "versionedKey:modifier:", CFSTR("mdta/com.apple.metadata_stream_item"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *MEMORY[0x24BDC0C50];
  v17[0] = *MEMORY[0x24BDC0C60];
  v2 = v17[0];
  v17[1] = v3;
  v4 = *MEMORY[0x24BDC0C08];
  v18[0] = v1;
  v18[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v15[0] = v2;
  v15[1] = v3;
  v16[0] = CFSTR("mdta/com.apple.metadata_stream_item");
  v16[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  formatDescriptionOut = 0;
  v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x6D656278u, v7, &formatDescriptionOut);
  if (v8)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v8;
      _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "Cannot create metadata stream format description (err: %d).", buf, 8u);
    }

    v10 = 0;
  }
  else
  {
    v10 = formatDescriptionOut;
  }

  return v10;
}

+ (id)attachmentsMIOMetadataItemForPixelBuffer:()MIOExtensions pts:error:
{
  CFDictionaryRef v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  uint64_t v17;

  v8 = CVBufferCopyAttachments(buffer, kCVAttachmentMode_ShouldPropagate);
  v9 = +[MIOPixelBufferUtility isPixelBufferRawBayer:](MIOPixelBufferUtility, "isPixelBufferRawBayer:", buffer);
  if ((v9 | +[MIOPixelBufferUtility isPixelBufferCompandedRawBayer:](MIOPixelBufferUtility, "isPixelBufferCompandedRawBayer:", buffer)) == 1)
  {
    v10 = (void *)-[__CFDictionary mutableCopy](v8, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(buffer));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("RawBayerFormat"));

    v12 = objc_msgSend(v10, "copy");
    v8 = (CFDictionaryRef)v12;
  }
  v13 = (void *)objc_opt_class();
  v16 = *a4;
  v17 = *((_QWORD *)a4 + 2);
  objc_msgSend(v13, "attachmentsMIOMetadataItemForDictionary:pts:error:", v8, &v16, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)attachmentsMIOTimedMetadataItemForSampleBuffer:()MIOExtensions pts:error:
{
  CFDictionaryRef v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  uint64_t v14;

  v7 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x24BDBD240], target, 1u);
  if (v7)
  {
    +[MOVStreamIOUtility getPlistFriendlyCopyOf:](MOVStreamIOUtility, "getPlistFriendlyCopyOf:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v10 = (void *)objc_opt_class();
  v13 = *a4;
  v14 = *((_QWORD *)a4 + 2);
  objc_msgSend(v10, "attachmentsMIOMetadataItemForDictionary:pts:error:", v9, &v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)attachmentsMIOMetadataItemForDictionary:()MIOExtensions pts:error:
{
  void *v7;
  void *v8;
  void *v9;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  CMTime v14;

  +[MOVStreamIOUtility plistFriendlyCopyOf:](MOVStreamIOUtility, "plistFriendlyCopyOf:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "objectForKey:", CFSTR("OriginalTimestampWhenWrittenToFile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v14 = *a4;
    v10 = CMTimeCopyAsDictionary(&v14, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("OriginalTimestampWhenWrittenToFile"));

  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 200, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_attachments"));
  objc_msgSend(v12, "setDataType:", *MEMORY[0x24BDC0C08]);
  objc_msgSend(v12, "setValue:", v11);

  return v12;
}

+ (id)trackMetadataItemWithStreamId:()MIOExtensions
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.track_kind"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setValue:", v3);

  return v4;
}

+ (id)qtTrackMetadataItemsForStreamId:()MIOExtensions
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "trackMetadataItemWithQTTrackCharacteristic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "trackMetadataItemWithQTTrackName:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v12 = v4;
    v13 = v5;
    v7 = &v12;
    v8 = 2;
  }
  else
  {
    v11 = v4;
    v7 = &v11;
    v8 = 1;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)trackMetadataItemWithQTTrackCharacteristic:()MIOExtensions
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKey:", *MEMORY[0x24BDB1EF0]);
  objc_msgSend(v4, "setKeySpace:", *MEMORY[0x24BDB1E50]);
  objc_msgSend(v4, "setValue:", v3);

  return v4;
}

+ (id)trackMetadataItemWithQTTrackName:()MIOExtensions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKey:", *MEMORY[0x24BDB1EF8]);
    objc_msgSend(v5, "setKeySpace:", *MEMORY[0x24BDB1E50]);
    objc_msgSend(v5, "setValue:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)trackMetadataItemWithInputPixelFormat:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_format"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)trackMetadataItemWithOutputPixelFormatOverride:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_output_pixel_format_override"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C18]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)trackMetadataItemWithEncodedPixelFormat:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_encoded_sample_format"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)trackMetadataItemWithRawBayerRearrangeType:()MIOExtensions
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
    v4 = v3;
  else
    v4 = &unk_24CA5BA00;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", CFSTR("mdta/com.apple.stream_raw_bayer_rearrange_type"));
  objc_msgSend(v5, "setDataType:", *MEMORY[0x24BDC0C30]);
  objc_msgSend(v5, "setExtraAttributes:", 0);
  objc_msgSend(v5, "setValue:", v4);

  return v5;
}

+ (id)trackMetadataItemWithSerializationMode:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)trackMetadataItemWithStereoViewEncoding:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_stereo_video"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)trackMetadataItemWithAdditionalCompressionProperties:()MIOExtensions error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[MOVStreamIOUtility plistFriendlyCopyOf:](MOVStreamIOUtility, "plistFriendlyCopyOf:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", CFSTR("mdta/com.apple.stream_additional_compression_properties"));
  objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C08]);
  objc_msgSend(v8, "setExtraAttributes:", 0);
  objc_msgSend(v8, "setValue:", v7);

  return v8;
}

+ (id)trackMetadataItemWithTimeRangeMetadata:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_time_range_metadata"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)trackMetadataItemWithExactBytesPerRow:()MIOExtensions pixelFormat:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row"));
  objc_msgSend(v6, "setExtraAttributes:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = +[MIOPixelBufferUtility numberOfPlanesForPixelFormatType:](PixelBufferUtility, "numberOfPlanesForPixelFormatType:", a4);
    if (v7 < 1)
    {
      objc_msgSend(v6, "setDataType:", *MEMORY[0x24BDC0C20]);
      objc_msgSend(v6, "setValue:", v5);
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      objc_msgSend(v8, "addObject:", v5);
      --v7;
    }
    while (v7);
    +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "setDataType:", *MEMORY[0x24BDC0C08]);
      objc_msgSend(v6, "setValue:", v9);
      objc_msgSend(v6, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"));

LABEL_10:
LABEL_15:
      v8 = v6;
      goto LABEL_18;
    }

LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = (id)objc_opt_class();
      v11 = v14;
      _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_ERROR, "Invalid 'exact-bytes-per-row' value type (%@), allowed types: NSNUmber, NSArray<NSNumber*>.", (uint8_t *)&v13, 0xCu);

    }
    goto LABEL_17;
  }
  +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:", v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v6, "setValue:", v8);
    objc_msgSend(v6, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"));
    goto LABEL_10;
  }
LABEL_18:

  return v8;
}

+ (id)customTrackMetadataItems:()MIOExtensions
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v15;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = *MEMORY[0x24BDC0C38];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("mdta/custom."), v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setIdentifier:", v11);
        objc_msgSend(v10, "setDataType:", v7);
        objc_msgSend(v10, "setExtraAttributes:", 0);
        objc_msgSend(v4, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:", v12);

        objc_msgSend(v3, "addObject:", v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

+ (id)metadataItemsForMetadataStreamFromData:()MIOExtensions copyData:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v15;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v15);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x24BDC0C08];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setIdentifier:", CFSTR("mdta/com.apple.metadata_stream_item"));
        objc_msgSend(v11, "setDataType:", v8);
        objc_msgSend(v11, "setExtraAttributes:", 0);
        if (a4)
        {
          v12 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v11, "setValue:", v12);

        }
        else
        {
          objc_msgSend(v11, "setValue:", v10);
        }
        objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

+ (id)mioMovieMetadataItem
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setObject:forKey:", CFSTR("3.29.2"), CFSTR("version"));
  +[MOVStreamIOUtility plistFriendlyCopyOf:](MOVStreamIOUtility, "plistFriendlyCopyOf:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v1, 100, 0, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_210675000, v4, OS_LOG_TYPE_ERROR, "Cannot serialize MIO mov metadata: %@", buf, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", CFSTR("mdta/com.apple.framework.state.MOVStreamIO"));
    objc_msgSend(v5, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v5, "setExtraAttributes:", 0);
    objc_msgSend(v5, "setValue:", v2);
  }

  return v5;
}

+ (id)movMetadataItemWithSessionStartTime:()MIOExtensions error:
{
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  CMTime v9;

  v9 = *a3;
  v5 = CMTimeCopyAsDictionary(&v9, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
  +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", CFSTR("mdta/com.apple.framework.mio.session.starttime"));
    objc_msgSend(v7, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v7, "setValue:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)movMetadataItemWithTimeRangeMetadataKeyHint:()MIOExtensions error:
{
  void *v0;
  void *v1;

  +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setIdentifier:", CFSTR("mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"));
    objc_msgSend(v1, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v1, "setValue:", v0);
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (void)valueAsMovSessionStartTime
{
  char v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  objc_msgSend(a1, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v9, "isEqualToString:", CFSTR("mdta/com.apple.framework.mio.session.starttime"));

  if ((v4 & 1) != 0)
  {
    objc_msgSend(a1, "dataValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:");
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      *(_QWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      CMTimeMakeFromDictionary((CMTime *)a2, v5);
    }
    else
    {
      v8 = MEMORY[0x24BDC0D38];
      *(_OWORD *)a2 = *MEMORY[0x24BDC0D38];
      *(_QWORD *)(a2 + 16) = *(_QWORD *)(v8 + 16);
    }

  }
  else
  {
    v7 = MEMORY[0x24BDC0D38];
    *(_OWORD *)a2 = *MEMORY[0x24BDC0D38];
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(v7 + 16);
  }
}

- (id)valueAsTimeRangeMetadataKeyHint
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"));

  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "dataValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)metadataItemForTimeRangeMetadataStartTime:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_time_range_start"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C20]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)metadataItemForTimeRangeMetadataEndTime:()MIOExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_time_range_end"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C20]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  return v4;
}

+ (id)metadataItemForTimeCode:()MIOExtensions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)a3 + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("counter"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)a3 + 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("flags"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", a3[11]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("frames"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", a3[8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("hours"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", a3[9]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("minutes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", a3[10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("seconds"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", a3[1]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("subframes_divisor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("subframes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)a3 + 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("type"));

  +[MOVStreamIOUtility plistFriendlyCopyOf:](MOVStreamIOUtility, "plistFriendlyCopyOf:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v14, 100, 0, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  if (v16)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_ERROR, "Cannot serialize time code for MIO metadata: %@", buf, 0xCu);
    }

    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIdentifier:", CFSTR("mdta/com.apple.stream_time_code"));
    objc_msgSend(v18, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v18, "setExtraAttributes:", 0);
    objc_msgSend(v18, "setValue:", v15);
  }

  return v18;
}

- (void)valueAsTimeCode
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  objc_msgSend(a1, "identifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v16, "isEqualToString:", CFSTR("mdta/com.apple.stream_time_code"));

  if ((v4 & 1) != 0)
  {
    objc_msgSend(a1, "dataValue");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("counter"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a2 + 4) = objc_msgSend(v7, "unsignedIntValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flags"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a2 + 12) = objc_msgSend(v8, "unsignedIntValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("frames"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(a2 + 22) = objc_msgSend(v9, "shortValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hours"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(a2 + 16) = objc_msgSend(v10, "shortValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("minutes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(a2 + 18) = objc_msgSend(v11, "shortValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seconds"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(a2 + 20) = objc_msgSend(v12, "shortValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subframes_divisor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(a2 + 2) = objc_msgSend(v13, "shortValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subframes"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)a2 = objc_msgSend(v14, "shortValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a2 + 8) = objc_msgSend(v15, "unsignedIntValue");

    }
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("identifier"));

  }
  objc_msgSend(a1, "dataType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "dataType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("dataType"));

  }
  objc_msgSend(a1, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("value"));

  }
  objc_msgSend(a1, "extraAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "extraAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("extraAttributes"));

  }
  return v2;
}

+ (id)metadataItemFromDictionary:()MIOExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v3, "objectForKey:", CFSTR("dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataType:", v6);

  objc_msgSend(v3, "objectForKey:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v7);

  objc_msgSend(v3, "objectForKey:", CFSTR("extraAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtraAttributes:", v8);

  return v4;
}

@end
