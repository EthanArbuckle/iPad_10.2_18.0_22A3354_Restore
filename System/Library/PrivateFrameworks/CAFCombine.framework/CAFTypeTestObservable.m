@implementation CAFTypeTestObservable

- (NSString)description
{
  _TtC10CAFCombine21CAFTypeTestObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  CAFTypeTestObservable.description.getter();
  v4 = v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x23B811BC4](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)dealloc
{
  _TtC10CAFCombine21CAFTypeTestObservable *v2;

  v2 = self;
  CAFTypeTestObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine21CAFTypeTestObservable)init
{
  CAFTypeTestObservable.init()();
}

- (void)typeTestService:(id)a3 didUpdateTestBool:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine21CAFTypeTestObservable *v6;

  v5 = a3;
  v6 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestBool:)();

}

- (void)typeTestService:(id)a3 didUpdateTestUInt8:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt8:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestUInt16:(unsigned __int16)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt16:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestUInt32:(unsigned int)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt32:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestUInt64:(unint64_t)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestUInt64:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestInt8:(char)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestInt8:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestInt16:(signed __int16)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestInt16:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestInt32:(int)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestInt32:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestInt64:(int64_t)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestInt64:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestFloat:(float)a4
{
  id v5;
  _TtC10CAFCombine21CAFTypeTestObservable *v6;

  v5 = a3;
  v6 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestFloat:)();

}

- (void)typeTestService:(id)a3 didUpdateTestString:(id)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestString:)();

  swift_bridgeObjectRelease();
}

- (void)typeTestService:(id)a3 didUpdateTestData:(id)a4
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestData:)((int)self, (int)a2, (int)a3, (int)a4, (int)CAFTypeTestObservable.typeTestService(_:didUpdateTestData:), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

- (void)typeTestService:(id)a3 didUpdateTestRawData:(id)a4
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestData:)((int)self, (int)a2, (int)a3, (int)a4, (int)CAFTypeTestObservable.typeTestService(_:didUpdateTestRawData:), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

- (void)typeTestService:(id)a3 didUpdateTestEnum:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestEnum:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestDimensionUnitRawValue:(unsigned __int16)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestDimensionUnitRawValue:)((uint64_t)v7, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestComplexItem:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItem:)((uint64_t)v8, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestArrayBool:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayBool:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayUInt8:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt8:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayUInt16:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt16:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayUInt32:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt32:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayUInt64:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayUInt64:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayInt8:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt8:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayInt16:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt16:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayInt32:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt32:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayInt64:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayInt64:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayFloat:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayBool:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayFloat:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayString:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayString:)(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x24BEE0D00], (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayString:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayData:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayString:)(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x24BDCDDE8], (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayData:));
}

- (void)typeTestService:(id)a3 didUpdateTestArrayRawData:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestArrayString:)(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x24BDCDDE8], (void (*)(void))CAFTypeTestObservable.typeTestService(_:didUpdateTestArrayRawData:));
}

- (void)typeTestService:(id)a3 didUpdateTestComplexItems:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItems:)((uint64_t)v8, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestComplexItemValue:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItemValue:)((uint64_t)v8, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestComplexItemList:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexItemList:)((uint64_t)v8, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestComplexArrayItemValue:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexArrayItemValue:)((uint64_t)v8, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestComplexNestedItemValue:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexNestedItemValue:)((uint64_t)v8, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestComplexNestedItemList:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexNestedItemList:)((uint64_t)v8, a4);

}

- (void)typeTestService:(id)a3 didUpdateTestComplexNestedListItemValue:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine21CAFTypeTestObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFTypeTestObservable.typeTestService(_:didUpdateTestComplexNestedListItemValue:)((uint64_t)v8, a4);

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine21CAFTypeTestObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFTypeTestObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine21CAFTypeTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTypeTestObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine21CAFTypeTestObservable *v5;

  v4 = a3;
  v5 = self;
  CAFTypeTestObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
