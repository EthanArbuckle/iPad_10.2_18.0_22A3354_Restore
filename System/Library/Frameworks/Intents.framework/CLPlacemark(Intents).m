@implementation CLPlacemark(Intents)

- (id)_intents_indexingRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("name"));

  objc_msgSend(a1, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "coordinate");
    objc_msgSend(v6, "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("longitude"));

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("latitude"));

  }
  objc_msgSend(a1, "postalAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("postalAddress"));

  return v2;
}

@end
