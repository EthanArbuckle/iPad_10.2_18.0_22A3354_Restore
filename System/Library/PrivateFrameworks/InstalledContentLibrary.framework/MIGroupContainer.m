@implementation MIGroupContainer

+ (id)groupContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v14;

  v7 = a5;
  v14 = 0;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v10, v9, 7, v7, &v14, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "makeContainerLiveWithError:", a6))
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

@end
