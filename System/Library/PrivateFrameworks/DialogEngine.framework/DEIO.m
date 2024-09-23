@implementation DEIO

+ (void)copyTo:(id)a3 from:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (v9 && v5)
  {
    v6 = getpagesize();
    objc_msgSend(v5, "readDataOfLength:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      do
      {
        if (!objc_msgSend(v7, "length"))
          break;
        objc_msgSend(v9, "writeData:", v7);
        objc_msgSend(v5, "readDataOfLength:", v6);
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
      }
      while (v8);

    }
    objc_msgSend(v9, "close");
  }

}

+ (id)readDataOfLength:(unint64_t)a3 offset:(unint64_t)a4 from:(id)a5
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;

  v7 = a5;
  v8 = objc_msgSend(v7, "length");
  if (v8 - a4 >= a3)
    v9 = a3;
  else
    v9 = v8 - a4;
  objc_msgSend(v7, "subdataWithRange:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
