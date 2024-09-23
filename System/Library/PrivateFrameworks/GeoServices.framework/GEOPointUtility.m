@implementation GEOPointUtility

+ (void)controlPoints:(id)a3 usesZilch:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
    v7 = (void *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
  else
    v7 = 0;

  return v7;
}

+ (unint64_t)pointCount:(id)a3 usesZilch:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
    v7 = (unint64_t)objc_msgSend(v5, "length") >> 5;
  else
    v7 = (unint64_t)objc_msgSend(v5, "length") >> 4;
  v8 = v7;

  return v8;
}

+ ($1AB5FA073B851C12C2339EC22442E995)pointAt:(unint64_t)a3 pointData:(id)a4 usesZilch:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  __n128 (*v19)(__n128 *, __n128 *);
  uint64_t (*v20)();
  const char *v21;
  __int128 v22;
  uint64_t v23;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v5 = a5;
  v7 = a4;
  if (+[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v7, v5) <= a3)
  {
    v8 = 0x7FEFFFFFFFFFFFFFLL;
    v9 = 0xC066800000000000;
    v10 = 0xC066800000000000;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x4812000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v21 = "";
    v22 = xmmword_189CC21A0;
    v23 = 0x7FEFFFFFFFFFFFFFLL;
    if (v5)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke;
      v15[3] = &unk_1E1C00538;
      v15[4] = &v16;
      v15[5] = 32 * a3;
      objc_msgSend(v7, "enumerateByteRangesUsingBlock:", v15);
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke_2;
      v14[3] = &unk_1E1C00538;
      v14[4] = &v16;
      v14[5] = 16 * a3;
      objc_msgSend(v7, "enumerateByteRangesUsingBlock:", v14);
    }
    v9 = v17[6];
    v10 = v17[7];
    v8 = v17[8];
    _Block_object_dispose(&v16, 8);
  }

  v11 = *(double *)&v9;
  v12 = *(double *)&v10;
  v13 = *(double *)&v8;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

void __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  zilch::ControlPoint *v10;
  zilch::GeoCoordinates *v11;
  zilch::GeoCoordinates *v12;
  double v13;
  double v14;
  zilch::GeoCoordinates *v15;
  double v16;
  double v17;
  uint64_t v18;
  zilch::GeoCoordinates *v19;
  double v20;
  double v21;
  zilch::GeoCoordinates *v22;
  double v23;
  double v24;
  zilch::GeoCoordinates *v25;
  int v26;
  double *v27;
  int v28;
  int v29;

  v5 = *(_QWORD *)(a1 + 40);
  v7 = v5 >= a3;
  v6 = v5 - a3;
  v7 = !v7 || v6 >= a4;
  if (!v7)
  {
    v10 = (zilch::ControlPoint *)(a2 + (v6 & 0xFFFFFFFFFFFFFFE0));
    v11 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
    if (zilch::GeoCoordinates::z(v11) == 0x7FFFFFFF)
    {
      v12 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      v29 = zilch::GeoCoordinates::y(v12);
      v14 = zilch::Latitude::toDegrees((zilch::Latitude *)&v29, v13);
      v15 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      v28 = zilch::GeoCoordinates::x(v15);
      v17 = zilch::Longitude::toDegrees((zilch::Longitude *)&v28, v16);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(double *)(v18 + 48) = v14;
      *(double *)(v18 + 56) = v17;
      *(_QWORD *)(v18 + 64) = 0;
    }
    else
    {
      v19 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      v29 = zilch::GeoCoordinates::y(v19);
      v21 = zilch::Latitude::toDegrees((zilch::Latitude *)&v29, v20);
      v22 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      v28 = zilch::GeoCoordinates::x(v22);
      v24 = zilch::Longitude::toDegrees((zilch::Longitude *)&v28, v23);
      v25 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      v26 = zilch::GeoCoordinates::z(v25);
      v27 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
      v27[6] = v21;
      v27[7] = v24;
      v27[8] = (double)v26 / 100.0;
    }
    *a5 = 1;
  }
}

__n128 __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  __n128 result;
  __n128 *v9;

  v5 = *(_QWORD *)(a1 + 40);
  v7 = v5 >= a3;
  v6 = v5 - a3;
  v7 = !v7 || v6 >= a4;
  if (!v7)
  {
    result = *(__n128 *)(a2 + (v6 & 0xFFFFFFFFFFFFFFF0));
    v9 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
    v9[3] = result;
    v9[4].n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    *a5 = 1;
  }
  return result;
}

+ (id)unpackPoints:(id)a3 usesZilch:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  if (v4)
    +[GEOPointUtility unpackZilchPoints:](GEOPointUtility, "unpackZilchPoints:", v5);
  else
    +[GEOPointUtility unpackBasicPoints:](GEOPointUtility, "unpackBasicPoints:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)unpackZilchPoints:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _BYTE v9[40];
  _BYTE v10[8];

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    zilch::Message::Message((zilch::Message *)v10);
    v4 = objc_retainAutorelease(v3);
    zilch::ReadBitstream::ReadBitstream((uint64_t)v9, (const unsigned __int8 *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
    if (zilch::Message::decode((zilch::Message *)v10, (zilch::ReadBitstream *)v9))
    {
      v5 = 0;
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D50]);
      v7 = zilch::Message::front((zilch::Message *)v10);
      v5 = (void *)objc_msgSend(v6, "initWithBytes:length:", v7, 32 * zilch::Message::size((zilch::Message *)v10));
    }
    zilch::Message::~Message((zilch::Message *)v10);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)unpackBasicPoints:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  unint64_t v38;
  unint64_t v39;
  double *v40;
  id v41;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_55;
  v4 = objc_retainAutorelease(v3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = 8 * objc_msgSend(v4, "length");
  if (v6 < 0x53)
    goto LABEL_55;
  LODWORD(v7) = 0;
  v8 = 0;
  do
  {
    if (v8 + 18 > v6)
      goto LABEL_55;
    v9 = 0;
    v10 = 18;
    do
    {
      v11 = 8 - (v8 & 7);
      if (v10 < v11)
        v11 = v10;
      v9 = (*(unsigned __int8 *)(v5 + (v8 >> 3)) >> (8 - (v8 & 7) - v11)) & ~(-1 << v11) | (v9 << v11);
      v8 += v11;
      v10 -= v11;
    }
    while (v10);
    if (v8 + 5 > v6)
      goto LABEL_55;
    v12 = 0;
    v13 = 5;
    do
    {
      v14 = 8 - (v8 & 7);
      if (v13 < v14)
        v14 = v13;
      v12 = (*(unsigned __int8 *)(v5 + (v8 >> 3)) >> (8 - (v8 & 7) - v14)) & ~(-1 << v14) | (v12 << v14);
      v8 += v14;
      v13 -= v14;
    }
    while (v13);
    v8 += (2 * v9 * v12) + 60;
    if (v6 < v8)
      goto LABEL_55;
    v7 = (v7 + v9 + 1);
  }
  while (v6 - v8 > 0x52);
  if (!(_DWORD)v7)
  {
LABEL_55:
    v41 = 0;
    goto LABEL_56;
  }
  v15 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 16 * v7));
  v16 = (char *)objc_msgSend(v15, "bytes");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  while (v20)
  {
    if (v19)
    {
      if (v17 + v19 > v6)
        goto LABEL_57;
      v23 = 0;
      v24 = v19;
      v25 = v19;
      do
      {
        v26 = 8 - (v17 & 7);
        if (v25 < v26)
          v26 = v25;
        v23 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v26)) & ~(-1 << v26) | (v23 << v26);
        v17 += v26;
        v25 -= v26;
      }
      while (v25);
      if (v17 + v19 > v6)
        goto LABEL_57;
      v27 = 0;
      v28 = v23 << -(char)v19 >> -(char)v19;
      do
      {
        v29 = 8 - (v17 & 7);
        if (v24 < v29)
          v29 = v24;
        v27 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v29)) & ~(-1 << v29) | (v27 << v29);
        v17 += v29;
        v24 -= v29;
      }
      while (v24);
      v22 += v28;
      v21 += v27 << (32 - v19) >> (32 - v19);
    }
    --v20;
LABEL_53:
    v40 = (double *)&v16[16 * v18];
    *v40 = (double)v22 / 1000000.0;
    v40[1] = (double)v21 / 1000000.0;
    if (++v18 == v7)
    {
      v41 = v15;
      goto LABEL_60;
    }
  }
  if (v17 + 18 <= v6)
  {
    v20 = 0;
    v30 = 18;
    do
    {
      v31 = 8 - (v17 & 7);
      if (v30 < v31)
        v31 = v30;
      v20 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v31)) & ~(-1 << v31) | (v20 << v31);
      v17 += v31;
      v30 -= v31;
    }
    while (v30);
    if (v17 + 5 <= v6)
    {
      v19 = 0;
      v32 = 5;
      do
      {
        v33 = 8 - (v17 & 7);
        if (v32 < v33)
          v33 = v32;
        v19 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v33)) & ~(-1 << v33) | (v19 << v33);
        v17 += v33;
        v32 -= v33;
      }
      while (v32);
      if (v17 + 30 <= v6)
      {
        v34 = 0;
        v35 = 30;
        do
        {
          v36 = 8 - (v17 & 7);
          if (v35 < v36)
            v36 = v35;
          v34 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v36)) & ~(-1 << v36) | (v34 << v36);
          v17 += v36;
          v35 -= v36;
        }
        while (v35);
        if (v17 + 30 <= v6)
        {
          v37 = 0;
          v22 = (4 * v34) >> 2;
          v38 = 30;
          do
          {
            v39 = 8 - (v17 & 7);
            if (v38 < v39)
              v39 = v38;
            v37 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v39)) & ~(-1 << v39) | (v37 << v39);
            v17 += v39;
            v38 -= v39;
          }
          while (v38);
          v21 = (4 * v37) >> 2;
          goto LABEL_53;
        }
      }
    }
  }
LABEL_57:
  if (v16)
    free(v16);
  v41 = 0;
LABEL_60:

LABEL_56:
  return v41;
}

+ (id)compressedZilchDataFromPoints:(void *)a3 fromPointIndex:(unint64_t)a4 pointCount:(unint64_t)a5
{
  BOOL v8;
  unint64_t v9;
  const zilch::ControlPoint *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  void **v16;

  zilch::Message::Message((zilch::Message *)&v16);
  v8 = a5 > a4;
  v9 = a5 - a4;
  if (v8)
  {
    v10 = (const zilch::ControlPoint *)((char *)a3 + 32 * a4);
    do
    {
      zilch::Message::addPoint(&v16, v10);
      v10 = (const zilch::ControlPoint *)((char *)v10 + 32);
      --v9;
    }
    while (v9);
  }
  if (zilch::Message::size((zilch::Message *)&v16))
  {
    zilch::WriteBitstream::WriteBitstream((zilch::WriteBitstream *)&v15);
    zilch::Message::encode((zilch::ControlPoint ***)&v16, (zilch::WriteBitstream *)&v15, 3);
    zilch::WriteBitstream::finalize((zilch::WriteBitstream *)&v15);
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    v12 = zilch::WriteBitstream::bytes((zilch::WriteBitstream *)&v15);
    v13 = (void *)objc_msgSend(v11, "initWithBytes:length:", v12, zilch::WriteBitstream::byteSize((zilch::WriteBitstream *)&v15));
    zilch::WriteBitstream::~WriteBitstream((zilch::WriteBitstream *)&v15);
  }
  else
  {
    v13 = 0;
  }
  zilch::Message::~Message((zilch::Message *)&v16);
  return v13;
}

+ (id)subdataFromPointData:(id)a3 fromPointIndex:(unint64_t)a4 usesZilch:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  char v9;
  unint64_t v10;
  id v11;
  void *v12;

  v5 = a5;
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (v5)
      v9 = 5;
    else
      v9 = 4;
    v10 = a4 << v9;
    if (v10 >= objc_msgSend(v7, "length"))
    {
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v8, "subdataWithRange:", v10, objc_msgSend(v8, "length") - v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v7;
  }
  v12 = v11;
LABEL_10:

  return v12;
}

+ (id)debugDescriptionForCompressedZilchData:(id)a3
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  +[GEOPointUtility unpackPoints:usesZilch:](GEOPointUtility, "unpackPoints:usesZilch:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v3, 1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Points: %d\n"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v4; ++i)
    {
      +[GEOPointUtility pointAt:pointData:usesZilch:](GEOPointUtility, "pointAt:pointData:usesZilch:", i, v3, 1);
      -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%f, %f\n"), v7, v8);
    }
  }
  else
  {
    v5 = CFSTR("Points: 0");
  }

  return v5;
}

@end
