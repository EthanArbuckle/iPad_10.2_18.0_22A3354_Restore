@implementation PatternExecutionResult

- (id)visualToString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void **v7;
  void *__p[2];
  char v10;
  void *v11[2];
  char v12;

  -[PatternExecutionResult visual](self, "visual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PatternExecutionResult visual](self, "visual");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
    siri::dialogengine::JsonFromResponseMessage((std::string::size_type)__p, v11);
    if (v10 < 0)
      operator delete(__p[0]);
    if (v12 >= 0)
      v7 = v11;
    else
      v7 = (void **)v11[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 < 0)
      operator delete(v11[0]);

  }
  return v3;
}

- (id)visualToJsonDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v7;

  -[PatternExecutionResult visualToString](self, "visualToString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 4, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)append:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  void *v16;
  void *__p[2];
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dialog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PatternExecutionResult dialog](self, "dialog");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[PatternExecutionResult dialog](self, "dialog");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

      }
      else
      {
        v9 = (void *)objc_opt_new();
      }

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v5, "dialog");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

      -[PatternExecutionResult setDialog:](self, "setDialog:", v9);
    }
    objc_msgSend(v5, "visual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      objc_msgSend(v5, "visual");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      AppendVisualResultToPatternExecutionResult(self, v16, (uint64_t)__p);
      if (v18 < 0)
        operator delete(__p[0]);

    }
  }

}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setPatternId:(id)a3
{
  objc_storeStrong((id *)&self->_patternId, a3);
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_storeStrong((id *)&self->_meta, a3);
}

- (NSArray)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
  objc_storeStrong((id *)&self->_dialog, a3);
}

- (NSData)visual
{
  return self->_visual;
}

- (void)setVisual:(id)a3
{
  objc_storeStrong((id *)&self->_visual, a3);
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setResponseMode:(id)a3
{
  objc_storeStrong((id *)&self->_responseMode, a3);
}

- (NSNumber)printSupportingDialog
{
  return self->_printSupportingDialog;
}

- (void)setPrintSupportingDialog:(id)a3
{
  objc_storeStrong((id *)&self->_printSupportingDialog, a3);
}

- (unint64_t)patternType
{
  return self->_patternType;
}

- (void)setPatternType:(unint64_t)a3
{
  self->_patternType = a3;
}

- (PatternVisualInfo)visualInfo
{
  return self->_visualInfo;
}

- (void)setVisualInfo:(id)a3
{
  objc_storeStrong((id *)&self->_visualInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualInfo, 0);
  objc_storeStrong((id *)&self->_printSupportingDialog, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_visual, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

@end
