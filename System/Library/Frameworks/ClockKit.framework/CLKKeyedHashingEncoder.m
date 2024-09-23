@implementation CLKKeyedHashingEncoder

- (CLKKeyedHashingEncoder)init
{
  objc_class *ObjectType;
  uint64_t v4;
  CLKKeyedHashingEncoder *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 0;
  v4 = OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs;
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)sub_211555768(MEMORY[0x24BEE4AF8]);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[CLKKeyedHashingEncoder init](&v7, sel_init);
}

- (BOOL)requiresSecureCoding
{
  return 0;
}

- (void)finishEncoding
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 1;
}

- (NSData)encodedData
{
  CLKKeyedHashingEncoder *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = KeyedHashingEncoder.encodedData.getter();
  v5 = v4;

  v6 = (void *)sub_21155B8EC();
  sub_2115577D0(v3, v5);
  return (NSData *)v6;
}

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CLKKeyedHashingEncoder_state);
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  void *v5;
  id v6;
  CLKKeyedHashingEncoder *v7;
  id v8;
  void *v9;
  id v10;

  v5 = (void *)*MEMORY[0x24BDD0E18];
  v6 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v7 = self;
  v8 = v5;
  v9 = (void *)sub_21155B964();
  v10 = objc_msgSend(v6, sel_initWithName_reason_userInfo_, v8, v9, 0);

  objc_msgSend(v10, sel_raise);
  abort();
}

- (void)encodeDataObject:(id)a3
{
  id v4;
  CLKKeyedHashingEncoder *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = self;
  sub_21155B8F8();

  v6 = (void *)*MEMORY[0x24BDD0E18];
  v7 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v8 = v6;
  v9 = (void *)sub_21155B964();
  v10 = objc_msgSend(v7, sel_initWithName_reason_userInfo_, v8, v9, 0);

  objc_msgSend(v10, sel_raise);
  abort();
}

- (void)encodeObject:(id)a3
{
  CLKKeyedHashingEncoder *v3;
  CLKKeyedHashingEncoder *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21155B9E8();
    swift_unknownObjectRelease();
  }
  else
  {
    v3 = self;
  }
  v5 = (void *)*MEMORY[0x24BDD0E18];
  v6 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v7 = v5;
  v8 = (void *)sub_21155B964();
  v9 = objc_msgSend(v6, sel_initWithName_reason_userInfo_, v7, v8, 0);

  objc_msgSend(v9, sel_raise);
  abort();
}

- (void)encodeRootObject:(id)a3
{
  CLKKeyedHashingEncoder *v4;
  _BYTE v5[32];
  _BYTE v6[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_21155B9E8();
  swift_unknownObjectRelease();
  sub_211557904((uint64_t)v6, (uint64_t)v5);
  KeyedHashingEncoder.encode(_:forKey:)((uint64_t)v5, 0xD000000000000021, 0x800000021156A000);
  sub_211557940((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  CLKKeyedHashingEncoder *v7;
  id v8;
  CLKKeyedHashingEncoder *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_21155B9E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v8 = a4;
    v9 = self;
  }
  v10 = sub_21155B970();
  v12 = v11;

  KeyedHashingEncoder.encode(_:forKey:)((uint64_t)v13, v10, v12);
  swift_bridgeObjectRelease();
  sub_211557940((uint64_t)v13);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CLKKeyedHashingEncoder *v9;
  Swift::String v10;

  v6 = sub_21155B970();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  KeyedHashingEncoder.encode(_:forKey:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (uint64_t)encodeInt:(unsigned int)a3 forKey:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = sub_21155B970();
  v7 = v6;
  v8 = a1;
  _s8ClockKit19KeyedHashingEncoderC10encodeCInt_6forKeyys5Int32V_SStF_0(a3, v5, v7);

  return swift_bridgeObjectRelease();
}

- (uint64_t)encodeInteger:(unint64_t)a3 forKey:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = sub_21155B970();
  v7 = v6;
  v8 = a1;
  sub_21155656C(a3, v5, v7);

  return swift_bridgeObjectRelease();
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CLKKeyedHashingEncoder *v9;
  Swift::String v10;

  v6 = sub_21155B970();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  KeyedHashingEncoder.encode(_:forKey:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CLKKeyedHashingEncoder *v9;
  Swift::String v10;

  v6 = sub_21155B970();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  KeyedHashingEncoder.encode(_:forKey:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (void)encodeBytes:(const char *)a3 length:(int64_t)a4 forKey:(id)a5
{
  CLKKeyedHashingEncoder *v8;

  sub_21155B970();
  v8 = self;
  KeyedHashingEncoder.encodeBytes(_:length:forKey:)(a3, a4);

  swift_bridgeObjectRelease();
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  CLKKeyedHashingEncoder *v5;
  id v6;
  CLKKeyedHashingEncoder *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_21155B9E8();

    swift_unknownObjectRelease();
  }
  else
  {
    v5 = self;
  }
  v8 = (void *)*MEMORY[0x24BDD0E18];
  v9 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v10 = v8;
  v11 = (void *)sub_21155B964();
  v12 = objc_msgSend(v9, sel_initWithName_reason_userInfo_, v10, v11, 0);

  objc_msgSend(v12, sel_raise);
  abort();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
