@implementation SNUtils

+ (void)logKShotSegments:(id)a3 exemplarIndex:(int64_t)a4
{
  unint64_t v5;

  type metadata accessor for SNKShotSegment(0);
  v5 = sub_1D451A92C();
  sub_1D44BD958(v5, a4);
  swift_bridgeObjectRelease();
}

+ (int)numberOfElements:(id)a3
{
  unint64_t v3;
  int v4;

  sub_1D42E9D88(0, (unint64_t *)&qword_1EFE404B0);
  v3 = sub_1D451A92C();
  v4 = sub_1D44BBDCC(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (unsigned)modelBlockSize:(id)a3 channelCount:(unsigned int)a4
{
  unint64_t v5;
  unsigned int v6;

  sub_1D42E9D88(0, (unint64_t *)&qword_1EFE404B0);
  v5 = sub_1D451A92C();
  v6 = sub_1D44BE0AC(v5, a4);
  swift_bridgeObjectRelease();
  return v6;
}

+ (BOOL)multiArrayConstraintLastDimensionIsFlexible:(id)a3
{
  id v3;
  char v4;
  char v5;

  v3 = a3;
  sub_1D44BC4D4(v3);
  v5 = v4;

  return v5 & 1;
}

+ (_NSRange)lastDimensionSizeRange:(id)a3
{
  id v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v3 = a3;
  v4 = sub_1D44BC5B8(v3);
  v6 = v5;

  v7 = (NSUInteger)v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

+ (id)userSuppliedInputFeatureNames:(id)a3
{
  id v4;
  void *v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  sub_1D44BBDB4(v4);

  v5 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return v5;
}

+ (BOOL)isRunningInDaemon
{
  return sub_1D44BBD7C(qword_1EFE478B8, (unsigned __int8 *)&byte_1EFEA7A60) & 1;
}

+ (BOOL)isInternalBuild
{
  return sub_1D44BBD7C(&qword_1EFE472D0, (unsigned __int8 *)&byte_1EFEA7718) & 1;
}

+ (id)toMLMultiArrayConvertFromFloatScalar:(id)a3 error:(id *)a4
{
  return sub_1D44BECB0((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1D44BE9A4);
}

+ (id)toFloatScalarConvertFromMLMultiArray:(id)a3 error:(id *)a4
{
  return sub_1D44BECB0((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1D44BEBA8);
}

+ (id)zeroBufferPopulator
{
  void *v2;
  _QWORD v4[6];

  v4[4] = sub_1D44BED30;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1D44BEE14;
  v4[3] = &unk_1E97B3968;
  v2 = _Block_copy(v4);
  swift_release();
  return v2;
}

+ (BOOL)flushBytesFromStreamSource:(id)a3 toBuffer:(void *)a4 ofSizeInBytes:(int64_t)a5 error:(id *)a6
{
  _QWORD *v8;
  uint64_t ObjCClassMetadata;

  v8 = _Block_copy(a3);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1D44BF0C0((uint64_t)a4, a5, ObjCClassMetadata, v8);
  return 1;
}

+ (BOOL)flushBytesFromPreciseTimeRangeInAudioFile:(id)a3 timeRange:(id *)a4 maxFramesPerBuffer:(unsigned int)a5 recycleBuffers:(BOOL)a6 prefixBufferPopulator:(id)a7 suffixBufferPopulator:(id)a8 intoSink:(id)a9 error:(id *)a10
{
  int64_t var3;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v23[2];
  __int128 v24;
  uint64_t v25;
  int64_t v26;

  var3 = a4->var1.var3;
  v23[0] = a4->var0.var0;
  v23[1] = *(_QWORD *)&a4->var0.var1;
  v24 = *(_OWORD *)&a4->var0.var3;
  v25 = *(_QWORD *)&a4->var1.var1;
  v26 = var3;
  v15 = _Block_copy(a7);
  v16 = _Block_copy(a8);
  v17 = _Block_copy(a9);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v16;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  swift_getObjCClassMetadata();
  v21 = a3;
  sub_1D44BF600(v21, (uint64_t)v23, a5, a6, (uint64_t (*)(void *, id, id *))sub_1D44C15AC, v18, (uint64_t (*)(void *, id, id *))sub_1D44C15AC, v19, (uint64_t)sub_1D44C13C8, v20);
  swift_release();
  swift_release();
  swift_release();

  return 1;
}

+ (id)createMultiArrayContainingPreciseTimeRangeOfAudioFile:(id)a3 timeRange:(id *)a4 maxFramesPerBuffer:(unsigned int)a5 recycleBuffers:(BOOL)a6 prefixBufferPopulator:(id)a7 suffixBufferPopulator:(id)a8 numDimensions:(int64_t)a9 error:(id *)a10
{
  int64_t var3;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  int64_t v25;

  var3 = a4->var1.var3;
  v22[0] = a4->var0.var0;
  v22[1] = *(_QWORD *)&a4->var0.var1;
  v23 = *(_OWORD *)&a4->var0.var3;
  v24 = *(_QWORD *)&a4->var1.var1;
  v25 = var3;
  v15 = _Block_copy(a7);
  v16 = _Block_copy(a8);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v16;
  swift_getObjCClassMetadata();
  v19 = a3;
  v20 = (void *)sub_1D44BF95C(v19, (uint64_t)v22, a5, a6, (uint64_t (*)(void *, id, id *))sub_1D44C13C8, v17, (uint64_t (*)(void *, id, id *))sub_1D44C15AC, v18, a9);
  swift_release();
  swift_release();

  return v20;
}

+ (id)loadModelAtURL:(id)a3 withTimeout:(double)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v12;

  v6 = sub_1D4519BC4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D4519B7C();
  v10 = (void *)sub_1D44BFEA0((uint64_t)v9, a4);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

- (SNUtils)init
{
  return (SNUtils *)sub_1D44C037C();
}

@end
