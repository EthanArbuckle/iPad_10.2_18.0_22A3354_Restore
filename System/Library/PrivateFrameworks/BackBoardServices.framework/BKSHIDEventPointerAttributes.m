@implementation BKSHIDEventPointerAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventPointerAttributes;
  v5 = -[BKSHIDEventDigitizerAttributes copyWithZone:](&v9, sel_copyWithZone_);
  *((_QWORD *)v5 + 16) = self->_contextType;
  *((_QWORD *)v5 + 15) = self->_contextMove;
  v6 = -[NSArray copyWithZone:](self->_hitTestContexts, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 17);
  *((_QWORD *)v5 + 17) = v6;

  objc_storeStrong((id *)v5 + 19, self->_hitTestSecurityAnalysis);
  *((_OWORD *)v5 + 10) = self->_unacceleratedRelativePosition;
  *((_OWORD *)v5 + 11) = self->_acceleratedRelativePosition;
  *((_QWORD *)v5 + 18) = self->_fingerDownCount;
  *((_BYTE *)v5 + 112) = self->_pointerEdgeMask;
  *((_WORD *)v5 + 57) = self->_teleportState;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  double *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventPointerAttributes;
  if (-[BKSHIDEventDigitizerAttributes isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (double *)v4;
    v6 = v5;
    v7 = self->_contextMove == *((_QWORD *)v5 + 15)
      && self->_contextType == *((_QWORD *)v5 + 16)
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_unacceleratedRelativePosition.x == v6[20]
      && self->_unacceleratedRelativePosition.y == v6[21]
      && self->_acceleratedRelativePosition.x == v6[22]
      && self->_acceleratedRelativePosition.y == v6[23]
      && self->_fingerDownCount == *((_QWORD *)v6 + 18)
      && self->_pointerEdgeMask == *((unsigned __int8 *)v6 + 112)
      && self->_teleportState == *((unsigned __int16 *)v6 + 57);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)unacceleratedRelativePositionX
{
  return self->_unacceleratedRelativePosition.x;
}

- (double)unacceleratedRelativePositionY
{
  return self->_unacceleratedRelativePosition.y;
}

- (void)setUnacceleratedRelativePositionX:(double)a3
{
  self->_unacceleratedRelativePosition.x = a3;
}

- (void)setUnacceleratedRelativePositionY:(double)a3
{
  self->_unacceleratedRelativePosition.y = a3;
}

- (double)acceleratedRelativePositionX
{
  return self->_acceleratedRelativePosition.x;
}

- (double)acceleratedRelativePositionY
{
  return self->_acceleratedRelativePosition.y;
}

- (void)setAcceleratedRelativePositionX:(double)a3
{
  self->_acceleratedRelativePosition.x = a3;
}

- (void)setAcceleratedRelativePositionY:(double)a3
{
  self->_acceleratedRelativePosition.y = a3;
}

- (unsigned)pointerState
{
  unint64_t contextType;
  unint64_t v3;
  uint64_t v4;
  unint64_t contextMove;

  contextType = self->_contextType;
  if (contextType >= 2)
  {
    if (contextType == 2)
    {
      contextMove = self->_contextMove;
      if (contextMove < 3)
        return 0x300040004uLL >> (16 * contextMove);
    }
LABEL_7:
    LOWORD(v4) = 2;
    return v4;
  }
  v3 = self->_contextMove;
  if (v3 >= 3)
    goto LABEL_7;
  return 0x300010002uLL >> (16 * v3);
}

- (void)setPointerState:(unsigned __int16)a3
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;

  if ((unsigned __int16)(a3 - 1) <= 3u)
  {
    v3 = (unsigned __int16)(a3 - 1);
    v4 = qword_18A1613A8[v3];
    v5 = qword_18A1613C8[v3];
    self->_contextType = v4;
    self->_contextMove = v5;
  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKSHIDEventPointerAttributes;
  -[BKSHIDEventDigitizerAttributes appendDescriptionToFormatter:](&v14, sel_appendDescriptionToFormatter_, v4);
  NSStringFromBKSHIDEventContextType(self->_contextType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("contextType"));

  NSStringFromBKSHIDEventContextMove(self->_contextMove);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("contextMove"));

  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_hitTestContexts, CFSTR("hitTestContexts"), 1);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_hitTestSecurityAnalysis, CFSTR("hitTestSecurityAnalysis"), 1);
  v9 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("unacceleratedRelativePosition"), self->_unacceleratedRelativePosition.x, self->_unacceleratedRelativePosition.y);
  v10 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("acceleratedRelativePosition"), self->_acceleratedRelativePosition.x, self->_acceleratedRelativePosition.y);
  if (self->_fingerDownCount >= 1)
    v11 = (id)objc_msgSend(v4, "appendInteger:withName:");
  if (self->_pointerEdgeMask)
  {
    NSStringFromBKSHIDEventScreenEdgeMask(self->_pointerEdgeMask);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v12, CFSTR("pointerEdgeMask"));

  }
  if (self->_teleportState)
  {
    NSStringFromBKSHIDEventTeleportState(self->_teleportState);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v13, CFSTR("teleportState"));

  }
}

- (int64_t)contextMove
{
  return self->_contextMove;
}

- (void)setContextMove:(int64_t)a3
{
  self->_contextMove = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (NSArray)hitTestContexts
{
  return self->_hitTestContexts;
}

- (void)setHitTestContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CGPoint)unacceleratedRelativePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_unacceleratedRelativePosition.x;
  y = self->_unacceleratedRelativePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnacceleratedRelativePosition:(CGPoint)a3
{
  self->_unacceleratedRelativePosition = a3;
}

- (CGPoint)acceleratedRelativePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_acceleratedRelativePosition.x;
  y = self->_acceleratedRelativePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAcceleratedRelativePosition:(CGPoint)a3
{
  self->_acceleratedRelativePosition = a3;
}

- (int64_t)fingerDownCount
{
  return self->_fingerDownCount;
}

- (void)setFingerDownCount:(int64_t)a3
{
  self->_fingerDownCount = a3;
}

- (unsigned)pointerEdgeMask
{
  return self->_pointerEdgeMask;
}

- (void)setPointerEdgeMask:(unsigned __int8)a3
{
  self->_pointerEdgeMask = a3;
}

- (unsigned)teleportState
{
  return self->_teleportState;
}

- (void)setTeleportState:(unsigned __int16)a3
{
  self->_teleportState = a3;
}

- (BKSWindowServerHitTestSecurityAnalysis)hitTestSecurityAnalysis
{
  return self->_hitTestSecurityAnalysis;
}

- (void)setHitTestSecurityAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_hitTestSecurityAnalysis, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->_hitTestContexts, 0);
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__BKSHIDEventPointerAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_434 != -1)
    dispatch_once(&protobufSchema_onceToken_434, block);
  return (id)protobufSchema_schema_433;
}

void __46__BKSHIDEventPointerAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_435);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_433;
  protobufSchema_schema_433 = v1;

}

void __46__BKSHIDEventPointerAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_contextType");
  objc_msgSend(v2, "addField:", "_contextMove");
  objc_msgSend(v2, "addRepeatingField:containsClass:", "_hitTestContexts", objc_opt_class());
  objc_msgSend(v2, "addField:", "_hitTestSecurityAnalysis");
  objc_msgSend(v2, "addField:", "_unacceleratedRelativePosition");
  objc_msgSend(v2, "addField:", "_acceleratedRelativePosition");
  objc_msgSend(v2, "addField:", "_fingerDownCount");
  objc_msgSend(v2, "addField:", "_pointerEdgeMask");
  objc_msgSend(v2, "addField:", "_teleportState");

}

@end
