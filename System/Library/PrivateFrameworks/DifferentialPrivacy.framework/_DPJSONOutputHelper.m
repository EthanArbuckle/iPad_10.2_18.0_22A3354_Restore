@implementation _DPJSONOutputHelper

+ (id)submissionContentForSegments:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n\"version\": %lu,\n\"segments\": [\n"), 21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  if (objc_msgSend(v3, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x1D8256B78]();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "jsonSegmentString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v10);

      if (v7 >= objc_msgSend(v3, "count") - 1)
        v11 = CFSTR("\n");
      else
        v11 = CFSTR(",\n");
      objc_msgSend(v6, "appendString:", v11);

      objc_autoreleasePoolPop(v8);
      ++v7;
    }
    while (v7 < objc_msgSend(v3, "count"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v5, v6, CFSTR("]\n}\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v12;
}

+ (unint64_t)currentVersion
{
  return 21;
}

@end
