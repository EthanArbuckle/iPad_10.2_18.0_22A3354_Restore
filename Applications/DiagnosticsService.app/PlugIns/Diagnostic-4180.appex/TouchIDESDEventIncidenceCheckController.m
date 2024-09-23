@implementation TouchIDESDEventIncidenceCheckController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[TouchIDESDEventIncidenceCheckController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((-[TouchIDESDEventIncidenceCheckController isCancelled](self, "isCancelled") & 1) != 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDESDEventIncidenceCheckController inputs](self, "inputs")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "biokitOptions")),
        v9 = (id)objc_claimAutoreleasedReturnValue(+[TouchIDManager runTouchIDDiagnostic:options:](TouchIDManager, "runTouchIDDiagnostic:options:", 5, v4)), v4, v3, !v9))
  {
    v9 = 0;
  }
  else if ((-[TouchIDESDEventIncidenceCheckController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDESDEventIncidenceCheckController result](self, "result"));
    objc_msgSend(v6, "setData:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("testStatus")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDESDEventIncidenceCheckController result](self, "result"));
    objc_msgSend(v8, "setStatusCode:", v7);

  }
  -[TouchIDESDEventIncidenceCheckController setFinished:](self, "setFinished:", 1);

}

- (TouchIDESDEventIncidenceCheckInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
