@implementation TKCloudKitWSRecord

+ (id)downloadURLFromCloudKitRecordResponse:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[3];
  id v14;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("records"));
  if (!v12 || !objc_msgSend(v12, "count"))
    goto LABEL_16;
  v11 = (id)objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v10 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fields"));
  v9 = (id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("message"));
  if (!v9)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  v8 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
  if (!v8)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v7 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("downloadURL"));
  if (v7 && objc_msgSend(v7, "length"))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
    v6 = (id)objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:");

    v14 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v5 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong(&v7, 0);
  if (!v5)
LABEL_12:
    v5 = 0;
  objc_storeStrong(&v8, 0);
  if (!v5)
LABEL_14:
    v5 = 0;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  if (!v5)
LABEL_16:
    v14 = 0;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v14;
}

@end
