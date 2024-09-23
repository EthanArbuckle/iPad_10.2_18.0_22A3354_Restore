@implementation GEORequestCounterLogInfo

+ (id)counterLogInfoWithDictionary:(id)a3
{
  id v3;
  GEORequestCounterLogInfo *v4;

  v3 = a3;
  v4 = -[GEORequestCounterLogInfo initWithDictionary:]([GEORequestCounterLogInfo alloc], "initWithDictionary:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterLogInfo)initWithDictionary:(id)a3
{
  id v4;
  GEORequestCounterLogInfo *v5;
  uint64_t v6;
  NSDictionary *dict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterLogInfo;
  v5 = -[GEORequestCounterLogInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;

  }
  return v5;
}

- (GEORequestCounterLogInfo)initWithCoder:(id)a3
{
  id v4;
  GEORequestCounterLogInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *dict;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEORequestCounterLogInfo;
  v5 = -[GEORequestCounterLogInfo init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v9, v8, CFSTR("dict"));
    v10 = objc_claimAutoreleasedReturnValue();
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dict, CFSTR("dict"));
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSDictionary isEqual:](self->_dict, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (NSString)appID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("appID"));
}

- ($C4D369C9F02205611300857CFD58F739)requestType
{
  void *v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  unint64_t v9;
  $C4D369C9F02205611300857CFD58F739 v10;

  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");
  v4 = (v3 >> 8) & 0x7F;
  if (v4 > 0xB)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v5 = 1 << v4;
    if ((v5 & 0xC05) != 0)
      v6 = v3;
    else
      v6 = 0;
    v7 = (v5 & 0xAA) == 0;
    if ((v5 & 0xAA) != 0)
      v8 = v3 & 0x7F00;
    else
      v8 = v6;
    if (v7)
      v9 = 0;
    else
      v9 = (unint64_t)v3 << 32;
  }
  v10 = ($C4D369C9F02205611300857CFD58F739)(v9 | v8);

  return v10;
}

- (NSString)requestTypeString
{
  return (NSString *)GEODataRequestKindAsString(-[GEORequestCounterLogInfo requestType](self, "requestType"));
}

- (unsigned)result
{
  void *v2;
  unsigned __int8 v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("result"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (NSString)resultString
{
  unsigned __int8 v2;

  v2 = -[GEORequestCounterLogInfo result](self, "result") + 2;
  if (v2 > 7u)
    return (NSString *)CFSTR("Success");
  else
    return &off_1E1C021D8[(char)v2]->isa;
}

- (unint64_t)xmitBytes
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("xmitB"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)recvBytes
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("recvB"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSDate)start
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("start"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)end
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("end"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (unint64_t)usedInterfaceTypes
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("iface"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dict;
}

- (void)_appendFormattedStringTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;

  v4 = a3;
  -[GEORequestCounterLogInfo requestTypeString](self, "requestTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORequestCounterLogInfo appID](self, "appID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v4;
  objc_msgSend(v8, "appendString:", &stru_1E1C241D0);
  objc_msgSend(v8, "appendString:", &stru_1E1C241D0);
  objc_msgSend(v8, "appendString:", v7);
  v9 = objc_msgSend(&stru_1E1C241D0, "length");
  v10 = objc_msgSend(&stru_1E1C241D0, "length") + v9;
  v11 = objc_msgSend(v7, "length");

  v12 = v10 + v11 + objc_msgSend(CFSTR(" "), "length");
  v13 = objc_msgSend(v6, "length");
  if ((unint64_t)(v12 + v13) <= 0x3C)
    v14 = 60 - (v12 + v13);
  else
    v14 = 0;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v14, CFSTR(" "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v15);

  objc_msgSend(v8, "appendString:", CFSTR(" "));
  objc_msgSend(v8, "appendString:", v6);
  objc_msgSend(v8, "appendString:", CFSTR("\n"));

  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", 60, CFSTR("-"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v16);

  objc_msgSend(v8, "appendString:", CFSTR("\n"));
  _byteFormatter();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromByteCount:", -[GEORequestCounterLogInfo xmitBytes](self, "xmitBytes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _byteFormatter();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromByteCount:", -[GEORequestCounterLogInfo recvBytes](self, "recvBytes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORequestCounterLogInfo start](self, "start");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORequestCounterLogInfo end](self, "end");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "timeIntervalSinceDate:", v56);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.03fs"), fmax(v21, 0.0));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  GEORequestCounterInterfaceTypesToStrings(-[GEORequestCounterLogInfo usedInterfaceTypes](self, "usedInterfaceTypes"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "componentsJoinedByString:", CFSTR(", "));
  v57 = (id)objc_claimAutoreleasedReturnValue();
  -[GEORequestCounterLogInfo resultString](self, "resultString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  v25 = v8;
  objc_msgSend(v25, "appendString:", &stru_1E1C241D0);
  objc_msgSend(v25, "appendString:", CFSTR("Xmit: "));
  objc_msgSend(v25, "appendString:", v24);
  v26 = objc_msgSend(&stru_1E1C241D0, "length");
  v27 = objc_msgSend(CFSTR("Xmit: "), "length") + v26;
  v28 = objc_msgSend(v24, "length");

  v29 = v27 + v28;
  v30 = objc_msgSend(CFSTR(" "), "length");
  v31 = v29 + v30 + objc_msgSend(v23, "length");
  v32 = v31 <= 0x3C;
  v33 = 60 - v31;
  if (v32)
    v34 = v33;
  else
    v34 = 0;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v34, CFSTR(" "), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendString:", v35);

  objc_msgSend(v25, "appendString:", CFSTR(" "));
  objc_msgSend(v25, "appendString:", v23);
  objc_msgSend(v25, "appendString:", CFSTR("\n"));

  v36 = v22;
  v37 = v20;
  v38 = v25;
  objc_msgSend(v38, "appendString:", &stru_1E1C241D0);
  objc_msgSend(v38, "appendString:", CFSTR("Recv: "));
  objc_msgSend(v38, "appendString:", v37);
  v39 = objc_msgSend(&stru_1E1C241D0, "length");
  v40 = objc_msgSend(CFSTR("Recv: "), "length") + v39;
  v41 = objc_msgSend(v37, "length");

  v42 = v40 + v41 + objc_msgSend(CFSTR(" "), "length");
  v43 = objc_msgSend(v36, "length");
  if ((unint64_t)(v42 + v43) <= 0x3C)
    v44 = 60 - (v42 + v43);
  else
    v44 = 0;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v44, CFSTR(" "), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "appendString:", v45);

  objc_msgSend(v38, "appendString:", CFSTR(" "));
  objc_msgSend(v38, "appendString:", v36);

  objc_msgSend(v38, "appendString:", CFSTR("\n"));
  v46 = v57;
  v58 = v38;
  objc_msgSend(v58, "appendString:", &stru_1E1C241D0);
  objc_msgSend(v58, "appendString:", CFSTR("Used Interfaces: "));
  objc_msgSend(v58, "appendString:", &stru_1E1C241D0);
  v47 = objc_msgSend(&stru_1E1C241D0, "length");
  v48 = objc_msgSend(CFSTR("Used Interfaces: "), "length") + v47;
  v49 = objc_msgSend(&stru_1E1C241D0, "length");
  v50 = v48 + v49 + objc_msgSend(&stru_1E1C241D0, "length");
  v51 = objc_msgSend(v46, "length");
  if ((unint64_t)(v50 + v51) <= 0x3C)
    v52 = 60 - (v50 + v51);
  else
    v52 = 0;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v52, CFSTR(" "), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "appendString:", v53);

  objc_msgSend(v58, "appendString:", &stru_1E1C241D0);
  objc_msgSend(v58, "appendString:", v46);

  objc_msgSend(v58, "appendString:", CFSTR("\n"));
  objc_msgSend(v58, "appendString:", CFSTR("\n"));

}

- (void)_appendFormattedCSVStringTo:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t i;
  const __CFString *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  v7 = 0;
  v8 = 0;
  v9 = (v6 >> 8) & 0x7F;
  v25 = v5;
  if (v9 <= 0xB)
  {
    v10 = 1 << v9;
    if ((v10 & 0xAA) != 0)
    {
      v8 = v6 & 0x7F00;
      v7 = (unint64_t)v6 << 32;
    }
    else if ((v10 & 0xC05) != 0)
    {
      v7 = 0;
      v8 = v6;
    }
  }
  GEODataRequestKindAsString(v7 | v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("result"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue") + 2;
  if (v13 > 7u)
    v14 = CFSTR("Success");
  else
    v14 = off_1E1C021D8[(char)v13];
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("appID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = v11;
  v26[2] = v14;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("xmitB"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("recvB"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v17;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("start"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v18;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("end"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v21);

  v22 = -[GEORequestCounterLogInfo usedInterfaceTypes](self, "usedInterfaceTypes");
  for (i = 0; i != 6; ++i)
  {
    if ((GEOAllRequestCounterInterfaceTypes[i] & v22) != 0)
      v24 = CFSTR(", Y");
    else
      v24 = CFSTR(", N");
    objc_msgSend(v4, "appendString:", v24);
  }
  objc_msgSend(v4, "appendString:", CFSTR("\n"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p : %@"), objc_opt_class(), self, self->_dict);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
