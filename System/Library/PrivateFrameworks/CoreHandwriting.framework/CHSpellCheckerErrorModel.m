@implementation CHSpellCheckerErrorModel

- (double)replacementErrorScoreForIntendedCharacter:(unsigned __int16)a3 actualCharacter:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  double v26;

  v6 = (const char *)a4;
  v8 = sub_1BE753F90((uint64_t)self, (const char *)a3, a3, a4, v4, v5);
  v13 = sub_1BE753F90((uint64_t)self, v6, v9, v10, v11, v12);
  v19 = objc_msgSend_count(&unk_1E78273F8, v14, v15, v16, v17, v18);
  v25 = objc_msgSend_count(&unk_1E78273F8, v20, v21, v22, v23, v24);
  v26 = 0.0;
  if (v8 < v19 && v13 < v25)
    v26 = (double)qword_1BE8D6C80[65 * v8 + v13];
  return v26 / -1000.0;
}

- (double)transpositionErrorScoreForIntendedFirstCharacter:(unsigned __int16)a3 intendedSecondCharacter:(unsigned __int16)a4
{
  return -100.0;
}

@end
