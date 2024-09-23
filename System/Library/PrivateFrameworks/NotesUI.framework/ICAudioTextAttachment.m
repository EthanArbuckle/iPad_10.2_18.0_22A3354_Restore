@implementation ICAudioTextAttachment

- (NSArray)supportedPresentationSizes
{
  uint64_t v3;
  id v4;
  ICAudioTextAttachment *v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E8680);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1ACA5B0B0;
  v4 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  v5 = self;
  *(_QWORD *)(v3 + 32) = objc_msgSend(v4, sel_initWithShort_, 1);
  sub_1ACA42258();

  sub_1AC7C3570(0, &qword_1ED6E90D0);
  v6 = (void *)sub_1ACA42210();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (ICAudioTextAttachment)initWithAttachment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICAudioTextAttachment;
  return -[ICBaseTextAttachment initWithAttachment:](&v4, sel_initWithAttachment_, a3);
}

- (ICAudioTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  void *v5;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  ICAudioTextAttachment *v16;
  objc_super v18;

  v5 = a3;
  if (a3)
  {
    v7 = a4;
    v8 = v5;
    v5 = (void *)sub_1ACA3F840();
    v10 = v9;

    if (a4)
    {
LABEL_3:
      sub_1ACA420C0();
      v12 = v11;

      goto LABEL_6;
    }
  }
  else
  {
    v13 = a4;
    v10 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
  }
  v12 = 0;
LABEL_6:
  if (v10 >> 60 != 15)
  {
    v14 = (void *)sub_1ACA3F834();
    if (v12)
      goto LABEL_8;
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v14 = 0;
  if (!v12)
    goto LABEL_10;
LABEL_8:
  v15 = (void *)sub_1ACA42090();
  swift_bridgeObjectRelease();
LABEL_11:
  v18.receiver = self;
  v18.super_class = (Class)ICAudioTextAttachment;
  v16 = -[ICTextAttachment initWithData:ofType:](&v18, sel_initWithData_ofType_, v14, v15);
  sub_1AC921E70((uint64_t)v5, v10);

  return v16;
}

- (ICAudioTextAttachment)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICAudioTextAttachment;
  return -[ICAudioTextAttachment initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
