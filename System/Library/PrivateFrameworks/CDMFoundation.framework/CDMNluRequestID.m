@implementation CDMNluRequestID

- (SIRINLUEXTERNALRequestID)objcProto
{
  return (SIRINLUEXTERNALRequestID *)sub_21A36DA74();
}

- (void)setObjcProto:(id)a3
{
  id v5;
  CDMNluRequestID *v6;

  v5 = a3;
  v6 = self;
  sub_21A36DB04(a3);

}

- (CDMNluRequestID)initWithObjcProto:(id)a3
{
  CDMNluRequestID *result;

  CDMNluRequestID.init(objcProto:)(a3);
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (CDMNluRequestID)init
{
  CDMNluRequestID.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___CDMNluRequestID_swiftProto;
  v4 = OUTLINED_FUNCTION_104_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
