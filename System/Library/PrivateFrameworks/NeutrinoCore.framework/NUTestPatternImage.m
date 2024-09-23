@implementation NUTestPatternImage

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  unint64_t v28;
  int v32;
  int v33;
  int v34;
  id v35;

  v35 = a9;
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("width"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("height"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");

  if (a8)
  {
    v19 = 0;
    v20 = v16 - 1;
    v21 = v18 - 1;
    v22 = (char *)a3 + 3;
    v23 = a6;
    do
    {
      if (a7)
      {
        v24 = v19 + a6;
        v25 = (v19 + a6) & 1;
        v26 = v22;
        v27 = a5;
        v28 = a7;
        do
        {
          *(v26 - 3) = -1;
          v32 = (v27 & 1) == 0 && v24 != 0 && v24 != v21 && v25 == 0;
          if (v20 == v27)
            v32 = 0;
          if (!v27)
            v32 = 0;
          v33 = v25 & v27;
          if (v20 == v27)
            v33 = 0;
          *(v26 - 2) = v32 << 31 >> 31;
          *(v26 - 1) = -((v23 + v27) & 1);
          if (v24 == v21)
            v34 = 0;
          else
            v34 = v33;
          *v26 = v34 << 31 >> 31;
          v26 += 4;
          ++v27;
          --v28;
        }
        while (v28);
      }
      ++v19;
      ++v23;
      v22 += a4;
    }
    while (v19 != a8);
  }

}

@end
