@implementation CDMNluResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SIRINLUEXTERNALCDMNluResponse)objcProto
{
  return (SIRINLUEXTERNALCDMNluResponse *)sub_21A332478();
}

- (void)setObjcProto:(id)a3
{
  id v5;
  CDMNluResponse *v6;

  v5 = a3;
  v6 = self;
  sub_21A332500(a3);
  OUTLINED_FUNCTION_20_8(v6);
}

- (CDMNluResponse)initWithObjcProto:(id)a3
{
  CDMNluResponse *result;

  CDMNluResponse.init(objcProto:)(a3);
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (CDMNluResponse)initWithCoder:(id)a3
{
  CDMNluResponse *result;

  CDMNluResponse.init(coder:)(a3);
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CDMNluResponse *v5;

  v4 = a3;
  v5 = self;
  sub_21A332E80(v4);

}

- (CDMNluResponse)init
{
  CDMNluResponse.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___CDMNluResponse_swiftProto;
  v4 = OUTLINED_FUNCTION_2_20();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
