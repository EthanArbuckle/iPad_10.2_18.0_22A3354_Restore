@implementation PHNumberPadKeyCommandHandler

- (PHNumberPadKeyCommandHandler)init
{

  return 0;
}

- (PHNumberPadKeyCommandHandler)initWithViewController:(id)a3 selector:(SEL)a4
{
  id v6;
  PHNumberPadKeyCommandHandler *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  if (qword_1002DC6D0 != -1)
    dispatch_once(&qword_1002DC6D0, &stru_100285240);
  v14.receiver = self;
  v14.super_class = (Class)PHNumberPadKeyCommandHandler;
  v7 = -[PHNumberPadKeyCommandHandler init](&v14, "init");
  if (v7)
  {
    if (objc_msgSend((id)qword_1002DC6C8, "length"))
    {
      v8 = 0;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002DC6C8, "substringWithRange:", v8, 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v9, 0, a4));
        objc_msgSend(v6, "addKeyCommand:", v10);

        ++v8;
      }
      while (v8 < (unint64_t)objc_msgSend((id)qword_1002DC6C8, "length"));
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, a4));
    objc_msgSend(v6, "addKeyCommand:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, a4));

    objc_msgSend(v6, "addKeyCommand:", v12);
  }

  return v7;
}

- (void)handleKeyCommand:(id)a3 receivedCharacterBlock:(id)a4 receivedSpecialCharacterBlock:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void (**v10)(id, uint64_t);
  id v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  int v27;
  id v28;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handling key command - %@", (uint8_t *)&v27, 0xCu);
  }

  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "input"));
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("\r"));

    if (v14)
    {
      v15 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling callback for PHNumberPadKeyCommandHandlerSpecialCharacterDial", (uint8_t *)&v27, 2u);
      }
      v17 = 1;
LABEL_12:

      v10[2](v10, v17);
      goto LABEL_13;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "input"));
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("\b"));

    if (v19)
    {
      v20 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling callback for PHNumberPadKeyCommandHandlerSpecialCharacterBackspace", (uint8_t *)&v27, 2u);
      }
      v17 = 0;
      goto LABEL_12;
    }
  }
LABEL_13:
  if (v9)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "input"));
    v22 = -[PHNumberPadKeyCommandHandler numberPadCharacterForString:](self, "numberPadCharacterForString:", v21);

    v23 = -[PHNumberPadKeyCommandHandler characterForNumberPadCharacter:](self, "characterForNumberPadCharacter:", v22);
    if ((_DWORD)v23)
    {
      v24 = v23;
      v25 = sub_1000C5588();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 67109120;
        LODWORD(v28) = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Calling callback for character '%c'", (uint8_t *)&v27, 8u);
      }

      v9[2](v9, v24);
    }
  }

}

- (char)characterForNumberPadCharacter:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
    return 48;
  else
    return a1234567890[a3];
}

- (int64_t)numberPadCharacterForString:(id)a3
{
  id v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  void *j;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", &off_100296F38);
  for (i = 0; i != 12; ++i)
  {
    v6 = qword_10023F260[i];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPNumberPadButton localizedLettersForCharacter:](TPNumberPadButton, "localizedLettersForCharacter:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedLowercaseString"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v8);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedLowercaseString"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    v15 = 13;
    while (2)
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v17, "containsString:", v10) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v17));
          v15 = (int)objc_msgSend(v18, "intValue");

          goto LABEL_14;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v15 = 13;
  }
LABEL_14:

  return v15;
}

@end
