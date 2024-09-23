@implementation SRCompactViewControllerContentTesterState

- (SRCompactViewControllerContentTesterState)initWithDeviceIsPad:(BOOL)a3 navigationStackIsPopping:(BOOL)a4 navigationStackSize:(int64_t)a5 navigationBarHasContent:(BOOL)a6 multiLevelViewHasContent:(BOOL)a7 editableUtteranceViewHasContent:(BOOL)a8 compactViewHasContent:(BOOL)a9 siriViewControllerIsEditing:(BOOL)a10 keyboardHasContent:(BOOL)a11 contextMenuIsPresented:(BOOL)a12
{
  SRCompactViewControllerContentTesterState *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SRCompactViewControllerContentTesterState;
  result = -[SRCompactViewControllerContentTesterState init](&v19, "init");
  if (result)
  {
    result->_deviceIsPad = a3;
    result->_navigationStackIsPopping = a4;
    result->_navigationStackSize = a5;
    result->_navigationBarHasContent = a6;
    result->_multiLevelViewHasContent = a7;
    result->_editableUtteranceViewHasContent = a8;
    result->_compactViewHasContent = a9;
    result->_siriViewControllerIsEditing = a10;
    result->_keyboardHasContent = a11;
    result->_contextMenuIsPresented = a12;
  }
  return result;
}

- (id)_debugDescriptionForProperty:(id)a3 formattedValue:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%@"), a3, a4);
}

- (id)_debugDescriptionForProperty:(id)a3 BOOLValue:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  return -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:formattedValue:](self, "_debugDescriptionForProperty:formattedValue:", a3, v4);
}

- (id)_debugDescriptionForProperty:(id)a3 integerValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%zd"), a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:formattedValue:](self, "_debugDescriptionForProperty:formattedValue:", v6, v7));

  return v8;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("<")));
  *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description", v5));
  objc_msgSend(v3, "appendString:", v7);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("deviceIsPad"), -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad")));
  v32[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("navigationStackIsPopping"), -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad")));
  v32[1] = v25;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:integerValue:](self, "_debugDescriptionForProperty:integerValue:", CFSTR("navigationStackSize"), -[SRCompactViewControllerContentTesterState navigationStackSize](self, "navigationStackSize")));
  v32[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("navigationBarHasContent"), -[SRCompactViewControllerContentTesterState navigationBarHasContent](self, "navigationBarHasContent")));
  v32[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("multiLevelViewHasContent"), -[SRCompactViewControllerContentTesterState multiLevelViewHasContent](self, "multiLevelViewHasContent")));
  v32[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("editableUtteranceViewHasContent"), -[SRCompactViewControllerContentTesterState editableUtteranceViewHasContent](self, "editableUtteranceViewHasContent")));
  v32[5] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("compactViewHasContent"), -[SRCompactViewControllerContentTesterState compactViewHasContent](self, "compactViewHasContent")));
  v32[6] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("siriViewControllerIsEditing"), -[SRCompactViewControllerContentTesterState siriViewControllerIsEditing](self, "siriViewControllerIsEditing")));
  v32[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("keyboardHasContent"), -[SRCompactViewControllerContentTesterState keyboardHasContent](self, "keyboardHasContent")));
  v32[8] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("contextMenuIsPresented"), -[SRCompactViewControllerContentTesterState contextMenuIsPresented](self, "contextMenuIsPresented")));
  v32[9] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 10));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v21);
        objc_msgSend(v3, "appendString:", CFSTR("\n\t"));
        objc_msgSend(v3, "appendString:", v22);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  v23 = objc_msgSend(v3, "mutableCopy");

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v4;
  _BOOL8 v5;
  int64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint64_t v14;
  SRCompactViewControllerContentTesterState *v15;

  v15 = [SRCompactViewControllerContentTesterState alloc];
  v4 = -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad");
  v5 = -[SRCompactViewControllerContentTesterState navigationStackIsPopping](self, "navigationStackIsPopping");
  v6 = -[SRCompactViewControllerContentTesterState navigationStackSize](self, "navigationStackSize");
  v7 = -[SRCompactViewControllerContentTesterState navigationBarHasContent](self, "navigationBarHasContent");
  v8 = -[SRCompactViewControllerContentTesterState multiLevelViewHasContent](self, "multiLevelViewHasContent");
  v9 = -[SRCompactViewControllerContentTesterState editableUtteranceViewHasContent](self, "editableUtteranceViewHasContent");
  v10 = -[SRCompactViewControllerContentTesterState compactViewHasContent](self, "compactViewHasContent");
  v11 = -[SRCompactViewControllerContentTesterState siriViewControllerIsEditing](self, "siriViewControllerIsEditing");
  v12 = -[SRCompactViewControllerContentTesterState keyboardHasContent](self, "keyboardHasContent");
  BYTE3(v14) = -[SRCompactViewControllerContentTesterState contextMenuIsPresented](self, "contextMenuIsPresented");
  BYTE2(v14) = v12;
  BYTE1(v14) = v11;
  LOBYTE(v14) = v10;
  return -[SRCompactViewControllerContentTesterState initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:](v15, "initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:", v4, v5, v6, v7, v8, v9, v14);
}

- (BOOL)deviceIsPad
{
  return self->_deviceIsPad;
}

- (BOOL)navigationStackIsPopping
{
  return self->_navigationStackIsPopping;
}

- (int64_t)navigationStackSize
{
  return self->_navigationStackSize;
}

- (BOOL)navigationBarHasContent
{
  return self->_navigationBarHasContent;
}

- (BOOL)multiLevelViewHasContent
{
  return self->_multiLevelViewHasContent;
}

- (BOOL)editableUtteranceViewHasContent
{
  return self->_editableUtteranceViewHasContent;
}

- (BOOL)compactViewHasContent
{
  return self->_compactViewHasContent;
}

- (BOOL)siriViewControllerIsEditing
{
  return self->_siriViewControllerIsEditing;
}

- (BOOL)keyboardHasContent
{
  return self->_keyboardHasContent;
}

- (BOOL)contextMenuIsPresented
{
  return self->_contextMenuIsPresented;
}

@end
