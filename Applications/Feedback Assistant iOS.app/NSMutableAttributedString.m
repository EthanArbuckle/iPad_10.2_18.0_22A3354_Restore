@implementation NSMutableAttributedString

+ (id)linkedAttributedFromString:(id)a3 withFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "linkedAttributedFromString:withFont:textColor:", v7, v6, v8));

  return v9;
}

+ (id)linkedAttributedFromString:(id)a3 withFont:(id)a4 textColor:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v7 = a4;
  v8 = a5;
  v9 = &stru_1000EA660;
  if (a3)
    v9 = (__CFString *)a3;
  v10 = v9;
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    +[UIFont systemFontSize](UIFont, "systemFontSize");
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  }
  v12 = v11;
  v13 = objc_alloc((Class)NSMutableAttributedString);
  v26[0] = NSFontAttributeName;
  v26[1] = NSForegroundColorAttributeName;
  v27[0] = v12;
  v27[1] = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v15 = objc_msgSend(v13, "initWithString:attributes:", v10, v14);

  v25 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDataDetector dataDetectorWithTypes:error:](NSDataDetector, "dataDetectorWithTypes:error:", 32, &v25));
  v17 = v25;
  v18 = -[__CFString length](v10, "length");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001456C;
  v23[3] = &unk_1000E6630;
  v19 = v15;
  v24 = v19;
  objc_msgSend(v16, "enumerateMatchesInString:options:range:usingBlock:", v10, 0, 0, v18, v23);

  v20 = v24;
  v21 = v19;

  return v21;
}

@end
