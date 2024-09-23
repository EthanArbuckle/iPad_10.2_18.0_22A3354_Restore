@implementation CDMNluRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SIRINLUEXTERNALCDMNluRequest)objcProto
{
  return (SIRINLUEXTERNALCDMNluRequest *)sub_21A387964();
}

- (void)setObjcProto:(id)a3
{
  id v5;
  CDMNluRequest *v6;

  v5 = a3;
  v6 = self;
  sub_21A3879EC(a3);
  OUTLINED_FUNCTION_20_8(v6);
}

- (CDMNluRequest)initWithObjcProto:(id)a3
{
  CDMNluRequest *result;

  CDMNluRequest.init(objcProto:)(a3);
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (CDMNluRequest)initWithCoder:(id)a3
{
  CDMNluRequest *result;

  CDMNluRequest.init(coder:)(a3);
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CDMNluRequest *v5;

  v4 = a3;
  v5 = self;
  sub_21A388244(v4);

}

- (CDMNluRequest)init
{
  CDMNluRequest.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___CDMNluRequest_swiftProto;
  v4 = OUTLINED_FUNCTION_118_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
