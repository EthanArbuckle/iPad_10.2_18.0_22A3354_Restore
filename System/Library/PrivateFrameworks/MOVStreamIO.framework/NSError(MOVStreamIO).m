@implementation NSError(MOVStreamIO)

+ (uint64_t)readerErrorWithMessage:()MOVStreamIO code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "movStreamIOErrorWithDomain:message:code:", CFSTR("com.apple.videoeng.streamreadererror"), a3, a4);
}

+ (uint64_t)writerErrorWithMessage:()MOVStreamIO code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "movStreamIOErrorWithDomain:message:code:", CFSTR("com.apple.videoeng.streamwritererror"), a3, a4);
}

+ (void)populateReaderError:()MOVStreamIO message:code:
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1540], "readerErrorWithMessage:code:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = v6;
    *a3 = objc_retainAutorelease(v6);
    v6 = v7;
  }

}

+ (void)populateWriterError:()MOVStreamIO message:code:
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = v6;
    *a3 = objc_retainAutorelease(v6);
    v6 = v7;
  }

}

+ (uint64_t)readerWarningWithMessage:()MOVStreamIO code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "movStreamIOWarningWithDomain:message:code:", CFSTR("com.apple.videoeng.streamreaderwarning"), a3, a4);
}

+ (void)populateStreamError:()MOVStreamIO message:code:
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = v6;
    *a3 = objc_retainAutorelease(v6);
    v6 = v7;
  }

}

+ (uint64_t)writerWarningWithMessage:()MOVStreamIO code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "movStreamIOWarningWithDomain:message:code:", CFSTR("com.apple.videoeng.streamwriterwarning"), a3, a4);
}

+ (uint64_t)streamErrorWithMessage:()MOVStreamIO code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "movStreamIOErrorWithDomain:message:code:", CFSTR("com.apple.videoeng.streamerror"), a3, a4);
}

+ (uint64_t)internalErrorWithMessage:()MOVStreamIO code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "movStreamIOErrorWithDomain:message:code:", CFSTR("com.apple.videoeng.streamerror"), a3, a4);
}

+ (uint64_t)internalWarningWithMessage:()MOVStreamIO code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "movStreamIOWarningWithDomain:message:code:", CFSTR("com.apple.videoeng.streamwarning"), a3, a4);
}

+ (id)mioPixelBufferPoolErrorWithMessage:()MOVStreamIO code:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.videoeng.miopixelbufferpoolerror"), a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR [MIOPixelBufferPool]: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&v11, 0xCu);
  }

  return v8;
}

+ (id)movStreamIOErrorWithDomain:()MOVStreamIO message:code:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR [MOVStreamIO]: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

+ (id)movStreamIOWarningWithDomain:()MOVStreamIO message:code:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_DEBUG, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: %{public}@ ⚠️⚠️⚠️", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

- (id)errorByAddingStreamId:()MOVStreamIO
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("Unknown");
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "code");
  if (!v7)
    v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("ErrorInfoStreamId"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = 138543362;
    v14 = v10;
    _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR [MOVStreamIO]: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

@end
