@implementation HealthAppDataTypeDetailLinkBuilder

- (id)URLForDataTypeDetailWithObjectType:(id)a3
{
  return -[HealthAppDataTypeDetailLinkBuilder URLForDataTypeDetailWithObjectType:trendOverlay:](self, "URLForDataTypeDetailWithObjectType:trendOverlay:", a3, 0);
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 trendOverlay:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HealthAppDataTypeDetailLinkBuilder baseURLComponentsWithObjectType:trendOverlay:](self, "baseURLComponentsWithObjectType:trendOverlay:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HealthAppLinkBuilder profileIdentifier](self, "profileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_hk_appendProfileIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 date:(id)a4
{
  return -[HealthAppDataTypeDetailLinkBuilder URLForDataTypeDetailWithObjectType:date:trendOverlay:](self, "URLForDataTypeDetailWithObjectType:date:trendOverlay:", a3, a4, 0);
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 date:(id)a4 trendOverlay:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HealthAppDataTypeDetailLinkBuilder baseURLComponentsWithObjectType:trendOverlay:](self, "baseURLComponentsWithObjectType:trendOverlay:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v17 = v16;

  objc_msgSend(v15, "numberWithInteger:", (uint64_t)v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB39D8];
  +[HAServicesDefines queryParameterNameDate](HAServicesDefines, "queryParameterNameDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "queryItemWithName:value:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v23);

  objc_msgSend(v9, "setQueryItems:", v14);
  objc_msgSend(v9, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HealthAppLinkBuilder profileIdentifier](self, "profileIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_hk_appendProfileIdentifier:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 dateInterval:(id)a4
{
  return -[HealthAppDataTypeDetailLinkBuilder URLForDataTypeDetailWithObjectType:dateInterval:trendOverlay:](self, "URLForDataTypeDetailWithObjectType:dateInterval:trendOverlay:", a3, a4, 0);
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 dateInterval:(id)a4 trendOverlay:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  HealthAppDataTypeDetailLinkBuilder *v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v36 = self;
  -[HealthAppDataTypeDetailLinkBuilder baseURLComponentsWithObjectType:trendOverlay:](self, "baseURLComponentsWithObjectType:trendOverlay:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "numberWithInteger:", (uint64_t)v17);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  objc_msgSend(v18, "numberWithInteger:", (uint64_t)v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB39D8];
  +[HAServicesDefines queryParameterNameStartDate](HAServicesDefines, "queryParameterNameStartDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "queryItemWithName:value:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v25;
  v26 = (void *)MEMORY[0x1E0CB39D8];
  +[HAServicesDefines queryParameterNameEndDate](HAServicesDefines, "queryParameterNameEndDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "queryItemWithName:value:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v30);

  objc_msgSend(v9, "setQueryItems:", v14);
  objc_msgSend(v9, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HealthAppLinkBuilder profileIdentifier](v36, "profileIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_hk_appendProfileIdentifier:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)baseURLComponentsWithObjectType:(id)a3 trendOverlay:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[HealthAppDataTypeDetailLinkBuilder baseURLForObjectType:](self, "baseURLForObjectType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
    objc_msgSend(v7, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = v11;

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB39D8];
      +[HAServicesDefines queryParameterNameTrendOverlay](HAServicesDefines, "queryParameterNameTrendOverlay");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "queryItemWithName:value:", v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

    }
    -[HealthAppLinkBuilder source](self, "source");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[HealthAppLinkBuilder source](self, "source");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0CB39D8];
        +[HAServicesDefines queryParameterNameSource](HAServicesDefines, "queryParameterNameSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HealthAppLinkBuilder source](self, "source");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "queryItemWithName:value:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v24);

      }
    }
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v7, "setQueryItems:", v12);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)standardBaseURLForObjectType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v9;

  if (-[HealthAppLinkBuilder useExternalURLScheme](self, "useExternalURLScheme"))
  {
    +[HAServicesDefines externalHealthAppURLScheme](HAServicesDefines, "externalHealthAppURLScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScheme:", v11);

    +[HAServicesDefines externalHealthAppURLHost](HAServicesDefines, "externalHealthAppURLHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", v12);
  }
  else
  {
    +[HAServicesDefines internalHealthAppURLScheme](HAServicesDefines, "internalHealthAppURLScheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScheme:", v12);
  }

  -[HealthAppLinkBuilder profileIdentifier](self, "profileIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if ((unint64_t)(v14 - 2) >= 2)
  {
    if (v14 != 1)
    {
      v23 = 0;
      goto LABEL_20;
    }
    if (!-[HealthAppLinkBuilder useExternalURLScheme](self, "useExternalURLScheme"))
    {
      +[HAServicesDefines sampleTypeHostName](HAServicesDefines, "sampleTypeHostName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHost:", v25);

      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("/%@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPath:", v20);
      goto LABEL_16;
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    +[HAServicesDefines sampleTypeHostName](HAServicesDefines, "sampleTypeHostName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("/%@/%@"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPath:", v21);
  }
  else
  {
    if (-[HealthAppLinkBuilder useExternalURLScheme](self, "useExternalURLScheme"))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      +[HAServicesDefines dataTypeDetailHostName](HAServicesDefines, "dataTypeDetailHostName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("/%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPath:", v17);

    }
    else
    {
      +[HAServicesDefines dataTypeDetailHostName](HAServicesDefines, "dataTypeDetailHostName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHost:", v16);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v4, "code"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB39D8];
    +[HAServicesDefines queryParameterNameDataTypeCode](HAServicesDefines, "queryParameterNameDataTypeCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "queryItemWithName:value:", v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v21);
  }

LABEL_16:
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v5, "setQueryItems:", v10);
  objc_msgSend(v5, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v23;
}

- (id)baseURLForObjectType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "code"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 15:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 61:
    case 62:
    case 63:
    case 70:
    case 71:
    case 72:
    case 73:
    case 75:
    case 78:
    case 79:
    case 80:
    case 83:
    case 87:
    case 89:
    case 90:
    case 91:
    case 92:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 110:
    case 111:
    case 113:
    case 114:
    case 118:
    case 124:
    case 125:
    case 137:
    case 138:
    case 139:
    case 140:
    case 144:
    case 145:
    case 147:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 178:
    case 179:
    case 182:
    case 183:
    case 186:
    case 187:
    case 188:
    case 189:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 199:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 229:
    case 230:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 236:
    case 237:
    case 240:
    case 241:
    case 242:
    case 243:
    case 244:
    case 248:
    case 249:
    case 250:
    case 251:
    case 256:
    case 257:
    case 258:
    case 259:
    case 260:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 269:
    case 270:
    case 272:
    case 274:
    case 275:
    case 276:
    case 277:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 286:
    case 287:
    case 288:
    case 294:
    case 295:
    case 296:
    case 297:
    case 301:
    case 302:
    case 303:
    case 305:
    case 313:
    case 314:
      -[HealthAppDataTypeDetailLinkBuilder standardBaseURLForObjectType:](self, "standardBaseURLForObjectType:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v5;
}

@end
