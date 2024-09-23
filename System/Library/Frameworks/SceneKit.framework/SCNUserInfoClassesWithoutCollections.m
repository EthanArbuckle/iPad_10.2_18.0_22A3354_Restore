@implementation SCNUserInfoClassesWithoutCollections

uint64_t __SCNUserInfoClassesWithoutCollections_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29 = objc_opt_class();
  v28 = objc_opt_class();
  v27 = objc_opt_class();
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v0 = (uint64_t)__SKSceneClass();
  if (!v0)
    v0 = objc_opt_class();
  v14 = v0;
  v1 = (uint64_t)__SKTextureClass();
  if (!v1)
    v1 = objc_opt_class();
  v13 = v1;
  v2 = (uint64_t)__GLKTextureInfoClass();
  if (!v2)
    v2 = objc_opt_class();
  v3 = (uint64_t)__AVPlayerClass();
  if (!v3)
    v3 = objc_opt_class();
  v4 = (uint64_t)__AVCaptureDeviceClass();
  if (!v4)
    v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  result = objc_msgSend(v30, "initWithObjects:", v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13,
             v2,
             v3,
             v4,
             v5,
             v6,
             v7,
             v8,
             v9,
             v10,
             v11,
             objc_opt_class(),
             0);
  SCNUserInfoClassesWithoutCollections_set = result;
  return result;
}

@end
