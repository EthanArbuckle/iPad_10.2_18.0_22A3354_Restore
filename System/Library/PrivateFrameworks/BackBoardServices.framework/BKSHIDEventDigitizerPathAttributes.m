@implementation BKSHIDEventDigitizerPathAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityAnalysis, 0);
  objc_storeStrong((id *)&self->_authenticationMessage, 0);
}

- (float)zGradient
{
  return self->_zGradient;
}

- (unsigned)touchIdentifier
{
  return self->_touchIdentifier;
}

- (BKSWindowServerHitTestSecurityAnalysis)securityAnalysis
{
  return self->_securityAnalysis;
}

- (double)preciseLocationY
{
  return self->_preciseLocation.y;
}

- (double)preciseLocationX
{
  return self->_preciseLocation.x;
}

- (double)hitTestLocationY
{
  return self->_hitTestLocation.y;
}

- (double)hitTestLocationX
{
  return self->_hitTestLocation.x;
}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  return self->_authenticationMessage;
}

- (void)setPathIndex:(int64_t)a3
{
  self->_pathIndex = a3;
}

- (void)setZGradient:(float)a3
{
  self->_zGradient = a3;
}

- (void)setUserIdentifier:(unsigned int)a3
{
  self->_userIdentifier = a3;
}

- (void)setTouchIdentifier:(unsigned int)a3
{
  self->_touchIdentifier = a3;
}

- (void)setPreciseLocation:(CGPoint)a3
{
  self->_preciseLocation = a3;
}

- (void)setLocus:(unsigned __int8)a3
{
  self->_locus = a3;
}

- (void)setHitTestLocation:(CGPoint)a3
{
  self->_hitTestLocation = a3;
}

- (unsigned)locus
{
  return self->_locus;
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BKSHIDEventDigitizerPathAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_234 != -1)
    dispatch_once(&protobufSchema_onceToken_234, block);
  return (id)protobufSchema_schema_233;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(_QWORD *)(v4 + 24) = self->_pathIndex;
  *(_DWORD *)(v4 + 12) = self->_touchIdentifier;
  *(_DWORD *)(v4 + 16) = self->_userIdentifier;
  *(_BYTE *)(v4 + 8) = self->_locus;
  *(float *)(v4 + 20) = self->_zGradient;
  *(CGPoint *)(v4 + 48) = self->_hitTestLocation;
  *(CGPoint *)(v4 + 64) = self->_preciseLocation;
  objc_storeStrong((id *)(v4 + 32), self->_authenticationMessage);
  objc_storeStrong((id *)(v4 + 40), self->_securityAnalysis);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventDigitizerPathAttributes;
  if (-[BKSHIDEventDigitizerPathAttributes isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (self->_pathIndex == *((_QWORD *)v5 + 3)
      && self->_touchIdentifier == *((_DWORD *)v5 + 3)
      && self->_userIdentifier == *((_DWORD *)v5 + 4)
      && self->_locus == v5[8]
      && self->_zGradient == *((float *)v5 + 5)
      && self->_hitTestLocation.x == *((double *)v5 + 6)
      && self->_hitTestLocation.y == *((double *)v5 + 7)
      && self->_preciseLocation.x == *((double *)v5 + 8)
      && self->_preciseLocation.y == *((double *)v5 + 9)
      && BSEqualObjects())
    {
      v7 = BSEqualObjects();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)setHitTestLocationX:(double)a3
{
  self->_hitTestLocation.x = a3;
}

- (void)setHitTestLocationY:(double)a3
{
  self->_hitTestLocation.y = a3;
}

- (void)setPreciseLocationX:(double)a3
{
  self->_preciseLocation.x = a3;
}

- (void)setPreciseLocationY:(double)a3
{
  self->_preciseLocation.y = a3;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v4 = (id)objc_msgSend(v13, "appendInteger:withName:", self->_pathIndex, CFSTR("pathIndex"));
  v5 = (id)objc_msgSend(v13, "appendInteger:withName:", self->_touchIdentifier, CFSTR("touchIdentifier"));
  v6 = (id)objc_msgSend(v13, "appendInteger:withName:", self->_userIdentifier, CFSTR("userIdentifier"));
  v7 = (id)objc_msgSend(v13, "appendInteger:withName:", self->_locus, CFSTR("locus"));
  v8 = (id)objc_msgSend(v13, "appendFloat:withName:", CFSTR("zGradient"), self->_zGradient);
  v9 = (id)objc_msgSend(v13, "appendPoint:withName:", CFSTR("hitTestLocation"), self->_hitTestLocation.x, self->_hitTestLocation.y);
  v10 = (id)objc_msgSend(v13, "appendPoint:withName:", CFSTR("preciseLocation"), self->_preciseLocation.x, self->_preciseLocation.y);
  v11 = (id)objc_msgSend(v13, "appendObject:withName:skipIfNil:", self->_authenticationMessage, CFSTR("authenticationMessage"), 1);
  v12 = (id)objc_msgSend(v13, "appendObject:withName:skipIfNil:", self->_securityAnalysis, CFSTR("securityAnalysis"), 1);

}

- (unsigned)userIdentifier
{
  return self->_userIdentifier;
}

- (CGPoint)hitTestLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_hitTestLocation.x;
  y = self->_hitTestLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)preciseLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_preciseLocation.x;
  y = self->_preciseLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAuthenticationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationMessage, a3);
}

- (void)setSecurityAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_securityAnalysis, a3);
}

void __52__BKSHIDEventDigitizerPathAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_235);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_233;
  protobufSchema_schema_233 = v1;

}

void __52__BKSHIDEventDigitizerPathAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_pathIndex");
  objc_msgSend(v2, "addField:", "_touchIdentifier");
  objc_msgSend(v2, "addField:", "_userIdentifier");
  objc_msgSend(v2, "addField:", "_locus");
  objc_msgSend(v2, "addField:", "_zGradient");
  objc_msgSend(v2, "addField:", "_hitTestLocation");
  objc_msgSend(v2, "addField:", "_preciseLocation");
  objc_msgSend(v2, "addField:", "_authenticationMessage");
  objc_msgSend(v2, "addField:", "_securityAnalysis");

}

@end
