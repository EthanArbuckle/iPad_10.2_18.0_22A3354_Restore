@implementation _NUFlexRangeProperties

- (id)copyWithZone:(_NSZone *)a3
{
  _NUFlexRangeProperties *v4;
  uint64_t v5;
  NSArray *channelInfo;

  v4 = +[_NUFlexRangeProperties allocWithZone:](_NUFlexRangeProperties, "allocWithZone:", a3);
  v4->_version = self->_version;
  v4->_baseHeadroom = self->_baseHeadroom;
  v4->_alternateHeadroom = self->_alternateHeadroom;
  v5 = -[NSArray copy](self->_channelInfo, "copy");
  channelInfo = v4->_channelInfo;
  v4->_channelInfo = (NSArray *)v5;

  v4->_useBaseColor = self->_useBaseColor;
  objc_storeStrong((id *)&v4->_compatibilityGainMapHeadroom, self->_compatibilityGainMapHeadroom);
  objc_storeStrong((id *)&v4->_alternateColorSpace, self->_alternateColorSpace);
  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[_NUFlexRangeProperties version](self, "version");
  -[_NUFlexRangeProperties baseHeadroom](self, "baseHeadroom");
  v7 = v6;
  -[_NUFlexRangeProperties baseHeadroom](self, "baseHeadroom");
  v9 = exp2f(v8);
  -[_NUFlexRangeProperties alternateHeadroom](self, "alternateHeadroom");
  v11 = v10;
  -[_NUFlexRangeProperties alternateHeadroom](self, "alternateHeadroom");
  v13 = exp2f(v12);
  if (-[_NUFlexRangeProperties useBaseColor](self, "useBaseColor"))
    v14 = CFSTR("base");
  else
    v14 = CFSTR("alternate");
  -[_NUFlexRangeProperties alternateColorSpace](self, "alternateColorSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUFlexRangeProperties channelInfo](self, "channelInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUFlexRangeProperties compatibilityGainMapHeadroom](self, "compatibilityGainMapHeadroom");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p version:%ld base:%0.2f(%0.2f) alt:%0.2f(%0.2f)color:%@ space:%@ channels:%@ compatibility:%@>"), v4, self, v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (float)baseHeadroom
{
  return self->_baseHeadroom;
}

- (void)setBaseHeadroom:(float)a3
{
  self->_baseHeadroom = a3;
}

- (float)alternateHeadroom
{
  return self->_alternateHeadroom;
}

- (void)setAlternateHeadroom:(float)a3
{
  self->_alternateHeadroom = a3;
}

- (NSArray)channelInfo
{
  return self->_channelInfo;
}

- (void)setChannelInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)useBaseColor
{
  return self->_useBaseColor;
}

- (void)setUseBaseColor:(BOOL)a3
{
  self->_useBaseColor = a3;
}

- (NSNumber)compatibilityGainMapHeadroom
{
  return self->_compatibilityGainMapHeadroom;
}

- (void)setCompatibilityGainMapHeadroom:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityGainMapHeadroom, a3);
}

- (NUColorSpace)alternateColorSpace
{
  return self->_alternateColorSpace;
}

- (void)setAlternateColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_alternateColorSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateColorSpace, 0);
  objc_storeStrong((id *)&self->_compatibilityGainMapHeadroom, 0);
  objc_storeStrong((id *)&self->_channelInfo, 0);
}

+ (id)flexRangePropertiesWithGainMapMetadata:(CGImageMetadata *)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t (**v7)(_QWORD, const __CFString *, uint64_t);
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  _NUFlexRangeProperties *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _NUFlexRangeChannelProperties *v18;
  void *v19;
  void (**v21)(_QWORD, _QWORD);
  uint64_t (**v22)(_QWORD, const __CFString *, uint64_t);
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[6];

  v3 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke;
  v31[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v31[4] = a3;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_2;
  v29[3] = &unk_1E5060E98;
  v4 = (id)MEMORY[0x1A85C1564](v31, a2);
  v30 = v4;
  v5 = (void *)MEMORY[0x1A85C1564](v29);
  v27[0] = v3;
  v27[1] = 3221225472;
  v27[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_312;
  v27[3] = &unk_1E5060EC0;
  v6 = v4;
  v28 = v6;
  v7 = (uint64_t (**)(_QWORD, const __CFString *, uint64_t))MEMORY[0x1A85C1564](v27);
  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_314;
  v25[3] = &unk_1E5060EE8;
  v8 = v6;
  v26 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85C1564](v25);
  v23[0] = v3;
  v23[1] = 3221225472;
  v23[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_317;
  v23[3] = &unk_1E5060F10;
  v10 = v5;
  v24 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85C1564](v23);
  (*((void (**)(id, const __CFString *))v8 + 2))(v8, CFSTR("Version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  if (v13)
  {
    v22 = v7;
    v14 = objc_alloc_init(_NUFlexRangeProperties);
    -[_NUFlexRangeProperties setVersion:](v14, "setVersion:", v13);
    (*((void (**)(id, const __CFString *))v10 + 2))(v10, CFSTR("BaseHeadroom"));
    -[_NUFlexRangeProperties setBaseHeadroom:](v14, "setBaseHeadroom:");
    (*((void (**)(id, const __CFString *))v10 + 2))(v10, CFSTR("AlternateHeadroom"));
    -[_NUFlexRangeProperties setAlternateHeadroom:](v14, "setAlternateHeadroom:");
    v21 = v9;
    ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("ChannelMetadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    if (objc_msgSend(v15, "count"))
    {
      v17 = 0;
      do
      {
        v18 = objc_alloc_init(_NUFlexRangeChannelProperties);
        ((void (**)(_QWORD, const __CFString *, unint64_t))v11)[2](v11, CFSTR("GainMapMin"), v17);
        -[_NUFlexRangeChannelProperties setMin:](v18, "setMin:");
        ((void (**)(_QWORD, const __CFString *, unint64_t))v11)[2](v11, CFSTR("GainMapMax"), v17);
        -[_NUFlexRangeChannelProperties setMax:](v18, "setMax:");
        ((void (**)(_QWORD, const __CFString *, unint64_t))v11)[2](v11, CFSTR("Gamma"), v17);
        -[_NUFlexRangeChannelProperties setGamma:](v18, "setGamma:");
        ((void (**)(_QWORD, const __CFString *, unint64_t))v11)[2](v11, CFSTR("BaseOffset"), v17);
        -[_NUFlexRangeChannelProperties setBaseOffset:](v18, "setBaseOffset:");
        ((void (**)(_QWORD, const __CFString *, unint64_t))v11)[2](v11, CFSTR("AlternateOffset"), v17);
        -[_NUFlexRangeChannelProperties setAlternateOffset:](v18, "setAlternateOffset:");
        objc_msgSend(v16, "addObject:", v18);

        ++v17;
      }
      while (v17 < objc_msgSend(v15, "count"));
    }
    v19 = (void *)objc_msgSend(v16, "copy");
    -[_NUFlexRangeProperties setChannelInfo:](v14, "setChannelInfo:", v19);

    v7 = v22;
    -[_NUFlexRangeProperties setUseBaseColor:](v14, "setUseBaseColor:", v22[2](v22, CFSTR("BaseColorIsWorkingColor"), 1));

    v9 = v21;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
