@implementation BKSHIDEventProximityAttributes

- (int)proximityDetectionMode
{
  return self->_proximityDetectionMode;
}

- (void)setProximityDetectionMode:(int)a3
{
  self->_proximityDetectionMode = a3;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BKSHIDEventProximityAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_541 != -1)
    dispatch_once(&protobufSchema_onceToken_541, block);
  return (id)protobufSchema_schema_540;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventProximityAttributes;
  result = -[BKSHIDEventBaseAttributes copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_DWORD *)result + 12) = self->_proximityDetectionMode;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventProximityAttributes;
  v5 = -[BKSHIDEventBaseAttributes isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_proximityDetectionMode == v4[12];

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventProximityAttributes;
  v4 = a3;
  -[BKSHIDEventBaseAttributes appendDescriptionToFormatter:](&v6, sel_appendDescriptionToFormatter_, v4);
  NSStringFromBKSHIDServicesProximityDetectionMode(self->_proximityDetectionMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("proximityDetectionMode"), v6.receiver, v6.super_class);

}

void __48__BKSHIDEventProximityAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_542);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_540;
  protobufSchema_schema_540 = v1;

}

uint64_t __48__BKSHIDEventProximityAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addField:", "_proximityDetectionMode");
}

@end
