@implementation JFXAnimojiEffect

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXAnimojiEffect)initWithCoder:(id)a3
{
  id v4;
  JFXAnimojiEffect *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JFXAnimojiEffect;
  v5 = -[JFXEffect initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kJFXCaptureInterfaceOrientationKey")))
      v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJFXCaptureInterfaceOrientationKey"));
    else
      v6 = 1;
    -[JFXAnimojiEffect setCaptureInterfaceOrientation:](v5, "setCaptureInterfaceOrientation:", v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXAnimojiEffect;
  v4 = a3;
  -[JFXEffect encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[JFXAnimojiEffect captureInterfaceOrientation](self, "captureInterfaceOrientation", v5.receiver, v5.super_class), CFSTR("kJFXCaptureInterfaceOrientationKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXAnimojiEffect;
  v4 = -[JFXEffect copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setCaptureInterfaceOrientation:", -[JFXAnimojiEffect captureInterfaceOrientation](self, "captureInterfaceOrientation"));
  return v4;
}

+ (id)animojiIDs
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_opt_class(), "isAvatarKitAvailable"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = objc_alloc_init(MEMORY[0x24BE0B4A8]);
    objc_msgSend(MEMORY[0x24BE0B488], "requestForCustomAvatars");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avatarsForFetchRequest:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BE0B488], "requestForPredefinedAvatars");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avatarsForFetchRequest:error:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

  }
  else
  {
    v2 = &unk_24EE9C410;
  }
  return v2;
}

+ (id)createAnimojiEffectForID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x24BE0B4A8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BE0B488], "requestForAvatarWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(v5, "avatarsForFetchRequest:error:", v6, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = AVTAvatarKitVersionNumber();
    objc_msgSend(MEMORY[0x24BE0B498], "avatarForRecord:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataRepresentation");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v20 = v8;
    if (v12)
    {
      v22[0] = CFSTR("JFXAnimojiEffectDataRepresentationKey");
      v22[1] = CFSTR("JFXAnimojiEffectAvatarVersionNumberKey");
      v23[0] = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createEffectForType:fromID:withProperties:", 7, v19, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v20;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)createMemojiEffectWithContentsOfFile:(id)a3 identifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12[0] = CFSTR("JFXAnimojiEffectDataRepresentationKey");
    v12[1] = CFSTR("JFXAnimojiEffectAvatarVersionNumberKey");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", AVTAvatarKitVersionNumber());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v8 = objc_claimAutoreleasedReturnValue();

    +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createEffectForType:fromID:withProperties:", 7, v5, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    JFXLog_automation();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[JFXAnimojiEffect createMemojiEffectWithContentsOfFile:identifier:].cold.1(v8);
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isAvatarKitAvailable
{
  if (isAvatarKitAvailable_onceToken != -1)
    dispatch_once(&isAvatarKitAvailable_onceToken, &__block_literal_global_32);
  return isAvatarKitAvailable_s_IsAvatarKitAvailable;
}

Class __40__JFXAnimojiEffect_isAvatarKitAvailable__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("AVTAnimoji"));
  isAvatarKitAvailable_s_IsAvatarKitAvailable = result != 0;
  return result;
}

- (UIImage)thumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__JFXAnimojiEffect_thumbnail__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  if (thumbnail_onceToken != -1)
    dispatch_once(&thumbnail_onceToken, block);
  if (thumbnail_s_AvatarKitHasAnimojiThumbnails == 1)
  {
    v3 = (void *)objc_opt_class();
    -[JFXEffect effectID](self, "effectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thumbnailForAnimojiNamed:options:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    -[JFXEffect effectID](self, "effectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIImage *)v5;
}

uint64_t __29__JFXAnimojiEffect_thumbnail__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "isAvatarKitAvailable");
  if ((_DWORD)result)
  {
    objc_opt_class();
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      thumbnail_s_AvatarKitHasAnimojiThumbnails = 1;
  }
  return result;
}

- (int)type
{
  return 7;
}

- (id)dataRepresentation
{
  void *v2;
  void *v3;

  -[JFXEffect effectParameters](self, "effectParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("JFXAnimojiEffectDataRepresentationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)avatarVersionNumber
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[JFXEffect effectParameters](self, "effectParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("JFXAnimojiEffectAvatarVersionNumberKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

- (id)renderEffect
{
  return 0;
}

- (BOOL)loadRenderEffect
{
  return 1;
}

- (void)loadRenderEffectInBackgroundWithCompletionOnMainQueue:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__JFXAnimojiEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke;
  block[3] = &unk_24EE580C8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __74__JFXAnimojiEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadRenderEffectOnQueue:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__JFXAnimojiEffect_loadRenderEffectOnQueue_completion___block_invoke;
  block[3] = &unk_24EE580C8;
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);

}

uint64_t __55__JFXAnimojiEffect_loadRenderEffectOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGAffineTransform)transform:(SEL)a3 basisOrigin:(CGRect)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("not supported"), 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (PVCGPointQuad)_convertRenderEffectPoints:(SEL)a3 toBasisRect:(PVCGPointQuad *)a4 basisOrigin:(CGRect)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("not supported"), 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 toBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("not supported"), 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 fromBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("not supported"), 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CGAffineTransform)_affineTransformFromEffectRect:(SEL)a3 toSize:(CGRect)a4 basisOrigin:(CGSize)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("not supported"), 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (int64_t)captureInterfaceOrientation
{
  return self->_captureInterfaceOrientation;
}

- (void)setCaptureInterfaceOrientation:(int64_t)a3
{
  self->_captureInterfaceOrientation = a3;
}

+ (void)createMemojiEffectWithContentsOfFile:(os_log_t)log identifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269A9000, log, OS_LOG_TYPE_ERROR, "Set Memoji Error: file not found", v1, 2u);
}

@end
