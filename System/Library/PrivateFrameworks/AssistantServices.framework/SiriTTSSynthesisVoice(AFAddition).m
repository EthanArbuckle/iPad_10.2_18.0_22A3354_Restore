@implementation SiriTTSSynthesisVoice(AFAddition)

- (void)updateWithTargetVoice:()AFAddition
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    objc_msgSend(a1, "setLanguage:", v6);
  v9 = v13;
  if (v13)
  {
    objc_msgSend(a1, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "isEqualToString:", v11);

    v9 = v13;
    if ((v12 & 1) == 0)
    {
      objc_msgSend(a1, "setName:", v13);
      goto LABEL_8;
    }
  }
  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_msgSend(a1, "setFootprint:", 1);
    objc_msgSend(a1, "setType:", 1);
    objc_msgSend(a1, "setVersion:", 0);
    goto LABEL_9;
  }
  objc_msgSend(a1, "setName:", v9);
LABEL_9:

}

- (uint64_t)AFVoiceGender
{
  uint64_t result;

  result = objc_msgSend(a1, "gender");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (uint64_t)AFVoiceFootprint
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "footprint");
  if (v1 > 3)
    return 0;
  else
    return qword_19B0ED660[v1];
}

- (id)SAVoiceGender
{
  uint64_t v1;
  id *v2;

  v1 = objc_msgSend(a1, "gender");
  if ((unint64_t)(v1 - 1) > 2)
    v2 = (id *)MEMORY[0x1E0D89320];
  else
    v2 = (id *)qword_1E3A2DDE0[v1 - 1];
  return *v2;
}

- (id)SAVoiceQuality
{
  unint64_t v1;
  id *v2;

  v1 = objc_msgSend(a1, "footprint");
  if (v1 > 3)
    v2 = (id *)MEMORY[0x1E0D89338];
  else
    v2 = (id *)qword_1E3A2DDF8[v1];
  return *v2;
}

- (id)SAVoiceType
{
  uint64_t v1;
  id *v2;

  v1 = objc_msgSend(a1, "type");
  if ((unint64_t)(v1 - 1) > 3)
    v2 = (id *)MEMORY[0x1E0D89340];
  else
    v2 = (id *)qword_1E3A2DE18[v1 - 1];
  return *v2;
}

@end
