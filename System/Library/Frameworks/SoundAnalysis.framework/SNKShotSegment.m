@implementation SNKShotSegment

- (SNKShotSegment)init
{
  SNKShotSegment *result;

  SNKShotSegment.init()();
  return result;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _QWORD v9[2];
  __int128 v10;
  uint64_t v11;
  int64_t v12;

  sub_1D42BFAC0((uint64_t)v9);
  v5 = v12;
  v6 = v9[1];
  v7 = v11;
  v8 = v10;
  retstr->var0.var0 = v9[0];
  *(_QWORD *)&retstr->var0.var1 = v6;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_QWORD *)&retstr->var1.var1 = v7;
  retstr->var1.var3 = v5;
  return result;
}

- (void)setTimeRange:(id *)a3
{
  int64_t var3;
  double v4[2];
  __int128 v5;
  uint64_t v6;
  int64_t v7;

  var3 = a3->var1.var3;
  v4[0] = *(double *)&a3->var0.var0;
  v4[1] = *(double *)&a3->var0.var1;
  v5 = *(_OWORD *)&a3->var0.var3;
  v6 = *(_QWORD *)&a3->var1.var1;
  v7 = var3;
  sub_1D42BFB74(v4);
}

- (NSURL)url
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1D4519BC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D42BFD40((uint64_t)v5);
  v6 = (void *)sub_1D4519B28();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (void)setUrl:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  SNKShotSegment *v7;
  uint64_t v8;

  v4 = sub_1D4519BC4();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D4519B7C();
  v7 = self;
  sub_1D42BFE4C((uint64_t)v6);

}

- (void).cxx_destruct
{
  sub_1D42C87B8((uint64_t)self + OBJC_IVAR___SNKShotSegment_impl);
}

@end
