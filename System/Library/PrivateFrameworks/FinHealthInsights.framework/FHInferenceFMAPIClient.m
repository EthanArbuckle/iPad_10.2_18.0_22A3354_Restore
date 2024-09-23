@implementation FHInferenceFMAPIClient

- (FHInferenceFMAPIClient)initWithDelegate:(id)a3 acDawTicket:(id)a4
{
  id v6;
  id v7;
  FHInferenceFMAPIClient *v8;
  FHInferenceFMAPIClient *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FHInferenceFMAPIClient;
  v8 = -[FHInferenceFMAPIClient init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_acDawTicket, a4);
    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v9;
}

- (void)sendPromptWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDD1850];
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionWithConfiguration:delegate:delegateQueue:", v10, self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)a4 > 2)
  {
    v14 = 0;
LABEL_7:
    objc_msgSend(v12, "invalidateAndCancel");
    goto LABEL_8;
  }
  v13 = *(id *)qword_250C748E0[a4];
  v14 = v13;
  if (!v8 || !v13 || !objc_msgSend(v8, "count"))
    goto LABEL_7;
  v24 = CFSTR("temperature");
  *(float *)&v15 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("acack=%@"), self->_acDawTicket);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDD16B0]);
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", v18, CFSTR("Cookie"));
  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v20, "setObject:forKey:", v14, CFSTR("model"));
  objc_msgSend(v20, "setObject:forKey:", v8, CFSTR("messages"));
  objc_msgSend(v20, "setObject:forKey:", v17, CFSTR("options"));
  objc_msgSend(v20, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("enable_logging"));
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BE314F0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setURL:", v21);

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v20, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHTTPBody:", v22);
  objc_msgSend(v12, "dataTaskWithRequest:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "resume");

LABEL_8:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  FHInferenceControllerDelegate **p_delegate;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  void (**v13)(id, uint64_t);

  v13 = (void (**)(id, uint64_t))a6;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)p_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v12, "inferenceDidBegin");

    }
  }
  v13[2](v13, 1);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  id v26;
  void *v27;
  id v28;
  id v29;
  id obj;
  id *location;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v28 = a4;
  v32 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v32, 4);
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v35;
    location = (id *)&self->_delegate;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = v13;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v16, 4, &v33);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v33;

          v13 = v18;
        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(v17, "objectForKey:", CFSTR("result"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "objectForKey:", CFSTR("delta"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", CFSTR("content"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), &stru_250C751F8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "length"))
          {
            WeakRetained = objc_loadWeakRetained(location);

            if (WeakRetained)
            {
              v26 = objc_loadWeakRetained(location);
              objc_msgSend(v26, "inferenceDidUpdateTextContent:", v24);

            }
          }

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  FHInferenceControllerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v12 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "inferenceDidCompleteWithError:", v12);

    }
  }

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  FHInferenceControllerDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  id v11;

  v11 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "inferenceDidFailWithError:", v11);

    }
  }

}

- (NSString)acDawTicket
{
  return self->_acDawTicket;
}

- (void)setAcDawTicket:(id)a3
{
  objc_storeStrong((id *)&self->_acDawTicket, a3);
}

- (FHInferenceControllerDelegate)delegate
{
  return (FHInferenceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_acDawTicket, 0);
}

@end
