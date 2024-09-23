@implementation CAMCaptureEncodingUtilities

+ (id)selectPhotoCodecFromAvailableCodecs:(id)a3 withBehavior:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (a4 != 1)
  {
    if (!a4)
    {
      v7 = (void *)*MEMORY[0x1E0C8AE88];
      goto LABEL_5;
    }
LABEL_6:
    objc_msgSend(v6, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = (void *)*MEMORY[0x1E0C8AE78];
  if (!objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8AE78]))
    goto LABEL_6;
LABEL_5:
  v8 = v7;
  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v8;
}

+ (id)selectVideoCodecFromAvailableCodecs:(id)a3 withBehavior:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)a4 > 2)
    v6 = 0;
  else
    v6 = **((id **)&unk_1EA328E00 + a4);
  if (objc_msgSend(v5, "containsObject:", v6))
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find desired codec %{public}@, using default of %{public}@ (available = %{public}@)", (uint8_t *)&v10, 0x20u);
    }

  }
  return v7;
}

@end
