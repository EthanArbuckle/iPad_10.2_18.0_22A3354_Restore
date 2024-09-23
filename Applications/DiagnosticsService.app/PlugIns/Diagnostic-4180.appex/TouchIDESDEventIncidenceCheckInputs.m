@implementation TouchIDESDEventIncidenceCheckInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v9;

  v9 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("kEsdMonitorTimeout"), &off_100004338, &off_100004350, 0, &v9));

  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kEsdMonitorTimeout"));
  -[TouchIDESDEventIncidenceCheckInputs setBiokitOptions:](self, "setBiokitOptions:", v5);
  v7 = v9 == 0;

  return v7;
}

- (NSDictionary)biokitOptions
{
  return self->_biokitOptions;
}

- (void)setBiokitOptions:(id)a3
{
  objc_storeStrong((id *)&self->_biokitOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biokitOptions, 0);
}

@end
