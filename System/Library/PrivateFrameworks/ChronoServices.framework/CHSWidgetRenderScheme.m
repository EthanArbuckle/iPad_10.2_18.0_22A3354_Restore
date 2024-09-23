@implementation CHSWidgetRenderScheme

uint64_t __33__CHSWidgetRenderScheme_isEqual___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __33__CHSWidgetRenderScheme_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __33__CHSWidgetRenderScheme_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t renderingMode;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t renderingModes;
  id v11;
  id v12;
  unint64_t backgroundViewPolicy;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  renderingMode = self->_renderingMode;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __33__CHSWidgetRenderScheme_isEqual___block_invoke;
  v21[3] = &unk_1E2A5A558;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", renderingMode, v21);
  renderingModes = self->_renderingModes;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __33__CHSWidgetRenderScheme_isEqual___block_invoke_2;
  v19[3] = &unk_1E2A5A558;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", renderingModes, v19);
  backgroundViewPolicy = self->_backgroundViewPolicy;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __33__CHSWidgetRenderScheme_isEqual___block_invoke_3;
  v17[3] = &unk_1E2A5A558;
  v14 = v11;
  v18 = v14;
  v15 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", backgroundViewPolicy, v17);
  LOBYTE(v11) = objc_msgSend(v5, "isEqual");

  return (char)v11;
}

- (CHSWidgetRenderScheme)init
{
  return -[CHSWidgetRenderScheme initWithRenderingMode:](self, "initWithRenderingMode:", 0);
}

- (CHSWidgetRenderScheme)initWithRenderingMode:(unint64_t)a3
{
  return -[CHSWidgetRenderScheme initWithRenderingMode:backgroundViewPolicy:](self, "initWithRenderingMode:backgroundViewPolicy:", a3, 0);
}

- (CHSWidgetRenderScheme)initWithRenderingMode:(unint64_t)a3 backgroundViewPolicy:(unint64_t)a4
{
  CHSWidgetRenderScheme *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHSWidgetRenderScheme;
  result = -[CHSWidgetRenderScheme init](&v7, sel_init);
  if (result)
  {
    result->_renderingMode = a3;
    result->_backgroundViewPolicy = a4;
  }
  return result;
}

- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3
{
  return -[CHSWidgetRenderScheme initWithRenderingModes:backgroundViewPolicy:](self, "initWithRenderingModes:backgroundViewPolicy:", a3, 0);
}

- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3 backgroundViewPolicy:(unint64_t)a4
{
  CHSWidgetRenderScheme *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHSWidgetRenderScheme;
  result = -[CHSWidgetRenderScheme init](&v7, sel_init);
  if (result)
  {
    result->_backgroundViewPolicy = a4;
    result->_renderingModes = a3;
  }
  return result;
}

- (void)_initWithWidgetRenderScheme:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)CHSWidgetRenderScheme;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[1] = v3[1];
      v4[3] = v3[3];
      v4[2] = v3[2];
    }
  }

  return a1;
}

- (unint64_t)renderingModes
{
  return self->_renderingModes;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetRenderScheme _initWithWidgetRenderScheme:](+[CHSMutableWidgetRenderScheme allocWithZone:](CHSMutableWidgetRenderScheme, "allocWithZone:", a3), self);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_renderingMode);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_renderingModes);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_backgroundViewPolicy);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t renderingModes;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCHSWidgetRenderingMode(self->_renderingMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("renderingMode"));

  renderingModes = self->_renderingModes;
  if (renderingModes)
  {
    NSStringFromCHSWidgetRenderingModes(renderingModes);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v6, CFSTR("renderingModes"));

  }
  NSStringFromCHSWidgetBackgroundViewPolicy(self->_backgroundViewPolicy);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("backgroundViewPolicy"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isValid
{
  return CHSWidgetRenderingModesIsValid(self->_renderingModes);
}

- (id)_compatibilityRenderSchemesFromDeprecatedRenderingModes
{
  unint64_t renderingModes;
  _QWORD *v3;
  uint8x8_t v4;
  int v5;
  unint64_t v6;
  id v7;
  _QWORD v9[2];
  void (*v10)(uint64_t, unint64_t);
  void *v11;
  CHSWidgetRenderScheme *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  char v20;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  renderingModes = self->_renderingModes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __80__CHSWidgetRenderScheme__compatibilityRenderSchemesFromDeprecatedRenderingModes__block_invoke;
  v11 = &unk_1E2A5AB30;
  v12 = self;
  v13 = &v14;
  v3 = v9;
  if (renderingModes)
  {
    v20 = 0;
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)renderingModes);
    v4.i16[0] = vaddlv_u8(v4);
    v5 = v4.i32[0];
    if (v4.i32[0])
    {
      v6 = 0;
      do
      {
        if (((1 << v6) & renderingModes) != 0)
        {
          ((void (*)(_QWORD *))v10)(v3);
          if (v20)
            break;
          --v5;
        }
        if (v6 > 0x3E)
          break;
        ++v6;
      }
      while (v5 > 0);
    }
  }

  v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __80__CHSWidgetRenderScheme__compatibilityRenderSchemesFromDeprecatedRenderingModes__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CHSWidgetRenderScheme *v7;

  if ((a2 & 2) != 0)
    v3 = 1;
  else
    v3 = (a2 >> 1) & 2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = -[CHSWidgetRenderScheme initWithRenderingMode:backgroundViewPolicy:]([CHSWidgetRenderScheme alloc], "initWithRenderingMode:backgroundViewPolicy:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_renderingMode), CFSTR("renderingMode"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_backgroundViewPolicy), CFSTR("backgroundViewPolicy"));

}

- (CHSWidgetRenderScheme)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetRenderScheme *v5;
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint8x8_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *);
  void *v17;
  CHSWidgetRenderScheme *v18;
  objc_super v19;
  char v20;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHSWidgetRenderScheme;
  v5 = -[CHSWidgetRenderScheme init](&v19, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("renderingModes")))
    {
      v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("renderingModes"));
      v7 = v6;
      v5->_renderingModes = v6;
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = (void (*)(uint64_t *))__39__CHSWidgetRenderScheme_initWithCoder___block_invoke;
      v17 = &unk_1E2A5B618;
      v18 = v5;
      v8 = &v14;
      if (v6)
      {
        v20 = 0;
        v9 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
        v9.i16[0] = vaddlv_u8(v9);
        v10 = v9.i32[0];
        if (v9.i32[0])
        {
          v11 = 0;
          do
          {
            if (((1 << v11) & v7) != 0)
            {
              v16(v8);
              if (v20)
                break;
              --v10;
            }
            if (v11 > 0x3E)
              break;
            ++v11;
          }
          while (v10 > 0);
        }
      }

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("renderingMode"), v14, v15))
      v5->_renderingMode = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("renderingMode"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("backgroundViewPolicy")))
      v12 = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("backgroundViewPolicy"));
    else
      v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("opaque")) ^ 1;
    v5->_backgroundViewPolicy = v12;
  }

  return v5;
}

uint64_t __39__CHSWidgetRenderScheme_initWithCoder___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = a2;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_renderingMode, CFSTR("renderingMode"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_backgroundViewPolicy, CFSTR("backgroundViewPolicy"));

}

- (CHSWidgetRenderScheme)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSWidgetRenderScheme *v5;

  v4 = a3;
  v5 = -[CHSWidgetRenderScheme initWithRenderingMode:backgroundViewPolicy:](self, "initWithRenderingMode:backgroundViewPolicy:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("renderingMode")), objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("backgroundViewPolicy")));

  return v5;
}

- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3 opaque:(BOOL)a4
{
  return -[CHSWidgetRenderScheme initWithRenderingModes:backgroundViewPolicy:](self, "initWithRenderingModes:backgroundViewPolicy:", a3, !a4);
}

- (BOOL)isOpaque
{
  return self->_backgroundViewPolicy == 0;
}

- (unint64_t)backgroundViewPolicy
{
  return self->_backgroundViewPolicy;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

@end
