@implementation SKCaptureUnarchiverDelegate

+ (id)sharedInstance
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[SKCaptureUnarchiverDelegate sharedInstance]::instance = objc_alloc_init(SKCaptureUnarchiverDelegate);
  }
  return (id)+[SKCaptureUnarchiverDelegate sharedInstance]::instance;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v5;
  objc_class *v6;
  uint64_t v7;
  objc_class *i;
  Class v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a5;
  v6 = (objc_class *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (objc_class *)((char *)i + 1))
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = NSClassFromString(*(NSString **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
        if (v9)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (objc_class *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
