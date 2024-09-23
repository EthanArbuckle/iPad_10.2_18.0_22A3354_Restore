@implementation SNAudioFileUtils

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)getTimeRangeEncompassingEntireAudioFileAtURL:(SEL)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  __int128 v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;

  v6 = sub_1D4519BC4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D4519B7C();
  swift_getObjCClassMetadata();
  v10 = sub_1D4469518(&v18);
  v11 = v18;
  v12 = v19;
  v13 = v20;
  v14 = v22;
  v15 = *((_QWORD *)&v18 + 1);
  v16 = v21;
  result = ($A0D62BC7BB322857EA05296DE7D5C3FF *)(*(uint64_t (**)(char *, uint64_t, double))(v7 + 8))(v9, v6, v10);
  retstr->var0.var0 = v11;
  *(_QWORD *)&retstr->var0.var1 = v15;
  retstr->var0.var3 = v12;
  retstr->var1.var0 = v13;
  *(_QWORD *)&retstr->var1.var1 = v16;
  retstr->var1.var3 = v14;
  return result;
}

- (SNAudioFileUtils)init
{
  return (SNAudioFileUtils *)sub_1D446AE74();
}

@end
