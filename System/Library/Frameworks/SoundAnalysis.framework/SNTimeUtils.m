@implementation SNTimeUtils

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)convertScaleForTimeRange:(SEL)a3 toValue:(id *)a4 preferShrinkingWhenRounding:(int)a5
{
  int64_t var3;
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _QWORD v13[2];
  __int128 v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17[2];
  __int128 v18;
  uint64_t v19;
  int64_t v20;

  var3 = a4->var1.var3;
  v17[0] = a4->var0.var0;
  v17[1] = *(_QWORD *)&a4->var0.var1;
  v18 = *(_OWORD *)&a4->var0.var3;
  v19 = *(_QWORD *)&a4->var1.var1;
  v20 = var3;
  result = ($A0D62BC7BB322857EA05296DE7D5C3FF *)sub_1D42D9358(v17, (uint64_t)v13);
  v9 = v16;
  v10 = v13[1];
  v11 = v15;
  v12 = v14;
  retstr->var0.var0 = v13[0];
  *(_QWORD *)&retstr->var0.var1 = v10;
  *(_OWORD *)&retstr->var0.var3 = v12;
  *(_QWORD *)&retstr->var1.var1 = v11;
  retstr->var1.var3 = v9;
  return result;
}

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)standardizeTimeRange:(SEL)a3 directionShouldBePositive:(id *)a4 negativeShouldResideInTimescale:(BOOL)a5
{
  CMTimeEpoch var3;
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  $A0D62BC7BB322857EA05296DE7D5C3FF v9;
  CMTimeRange v10;

  var3 = a4->var1.var3;
  v10.start.value = a4->var0.var0;
  *(_QWORD *)&v10.start.timescale = *(_QWORD *)&a4->var0.var1;
  *(_OWORD *)&v10.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(_QWORD *)&v10.duration.timescale = *(_QWORD *)&a4->var1.var1;
  v10.duration.epoch = var3;
  sub_1D42D965C(&v10, a5, a6);
  *retstr = v9;
  return result;
}

+ (void)clipTimeRange:(id *)a3 toBounds:(id *)a4 handler:(id)a5
{
  CMTimeValue var0;
  CMTimeValue v6;
  CMTimeEpoch var3;
  _QWORD *v8;
  uint64_t ObjCClassMetadata;
  CMTimeRange v10;
  CMTimeRange v11;

  var0 = a3->var0.var0;
  v6 = a4->var0.var0;
  var3 = a4->var1.var3;
  v10.duration.epoch = a3->var1.var3;
  v11.start.value = v6;
  *(_QWORD *)&v11.start.timescale = *(_QWORD *)&a4->var0.var1;
  *(_OWORD *)&v11.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(_QWORD *)&v11.duration.timescale = *(_QWORD *)&a4->var1.var1;
  v11.duration.epoch = var3;
  v10.start.value = var0;
  *(_QWORD *)&v10.start.timescale = *(_QWORD *)&a3->var0.var1;
  *(_OWORD *)&v10.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_QWORD *)&v10.duration.timescale = *(_QWORD *)&a3->var1.var1;
  v8 = _Block_copy(a5);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1D42D9780(&v10, &v11, ObjCClassMetadata, v8);
}

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)clipTimeRange:(SEL)a3 toBounds:(id *)a4
{
  CMTimeValue var0;
  CMTimeEpoch var3;
  CMTimeEpoch v8;
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  $A0D62BC7BB322857EA05296DE7D5C3FF v10;
  CMTimeRange v11;
  CMTimeRange v12;

  var0 = a4->var0.var0;
  var3 = a4->var1.var3;
  v8 = a5->var1.var3;
  v12.start.value = a5->var0.var0;
  *(_QWORD *)&v12.start.timescale = *(_QWORD *)&a5->var0.var1;
  *(_OWORD *)&v12.start.epoch = *(_OWORD *)&a5->var0.var3;
  *(_QWORD *)&v12.duration.timescale = *(_QWORD *)&a5->var1.var1;
  v12.duration.epoch = v8;
  v11.start.value = var0;
  *(_QWORD *)&v11.start.timescale = *(_QWORD *)&a4->var0.var1;
  *(_OWORD *)&v11.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(_QWORD *)&v11.duration.timescale = *(_QWORD *)&a4->var1.var1;
  v11.duration.epoch = var3;
  swift_getObjCClassMetadata();
  sub_1D42DA7A4(&v11, &v12);
  *retstr = v10;
  return result;
}

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)addOffset:(SEL)a3 toTimeRange:(id *)a4
{
  CMTimeValue var0;
  uint64_t v7;
  CMTimeEpoch var3;
  int64_t v9;
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _QWORD v15[2];
  __int128 v16;
  uint64_t v17;
  int64_t v18;
  CMTimeValue v19[2];
  __int128 v20;
  uint64_t v21;
  int64_t v22;

  var0 = a4->var0;
  v7 = *(_QWORD *)&a4->var1;
  var3 = a4->var3;
  v9 = a5->var1.var3;
  v19[0] = a5->var0.var0;
  v19[1] = *(_QWORD *)&a5->var0.var1;
  v20 = *(_OWORD *)&a5->var0.var3;
  v21 = *(_QWORD *)&a5->var1.var1;
  v22 = v9;
  sub_1D42DA8B4(var0, v7, var3, v19, (uint64_t)v15);
  v11 = v18;
  v12 = v15[1];
  v13 = v17;
  v14 = v16;
  retstr->var0.var0 = v15[0];
  *(_QWORD *)&retstr->var0.var1 = v12;
  *(_OWORD *)&retstr->var0.var3 = v14;
  *(_QWORD *)&retstr->var1.var1 = v13;
  retstr->var1.var3 = v11;
  return result;
}

- (SNTimeUtils)init
{
  return (SNTimeUtils *)SNTimeUtils.init()();
}

@end
