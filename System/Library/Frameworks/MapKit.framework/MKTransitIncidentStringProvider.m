@implementation MKTransitIncidentStringProvider

+ (id)cellTitleForIncident:(id)a3
{
  return (id)objc_msgSend(a3, "title");
}

+ (id)cellSecondaryTextForIncident:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "messageForRoutePlanning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "title");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(v3, "summary"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      _MKLocalizedStringFromThisBundle(CFSTR("Transit_Incident_Title_And_Summary"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "title");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "summary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
    else
    {
      objc_msgSend(v3, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v9 = v13;
        v12 = (uint64_t)v9;
      }
      else
      {
        objc_msgSend(v3, "summary");
        v12 = objc_claimAutoreleasedReturnValue();
        v9 = 0;
      }
    }

    v4 = (void *)v12;
  }

  return v4;
}

@end
