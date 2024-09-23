@implementation CBAODFlipBookWrapper

- (CBAODFlipBookWrapper)initWithHeader:(id *)a3 andOrigin:(id *)a4
{
  char *v4;
  id v5;
  objc_super v9;
  $22B845C3FD2DCB84D05BF442A0079DD7 *v10;
  $ADF2D17A2D0006A1E21E182AFD270E1C *v11;
  SEL v12;
  char *v13;

  v13 = (char *)self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CBAODFlipBookWrapper;
  v13 = -[CBAODFlipBookWrapper init](&v9, sel_init);
  if (v13)
  {
    v4 = v13;
    *(_OWORD *)(v13 + 24) = *(_OWORD *)&a3->var0;
    *(_QWORD *)(v4 + 39) = *(_QWORD *)((char *)&a3->var3 + 3);
    memcpy(v13 + 48, a4, 0x4CuLL);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v13 + 1) = v5;
  }
  return (CBAODFlipBookWrapper *)v13;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAODFlipBookWrapper *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBAODFlipBookWrapper;
  -[CBAODFlipBookWrapper dealloc](&v2, sel_dealloc);
}

- (id)description
{
  uint64_t v3;
  double v4;
  unsigned int v5;
  double v6;
  uint64_t v7;
  double ambient;
  double brightness;
  double brightnessLimit;
  double v11;
  double x;
  double y;
  double pccFactor;
  double twilightStrength;
  double twilightLux;
  double ammoliteStrength;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  SEL v25;
  CBAODFlipBookWrapper *v26;

  v26 = self;
  v25 = a2;
  v24 = (id)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = *(float *)((char *)&v26->_header.numberOfUpdates + 3);
  v5 = *(unsigned __int16 *)((char *)&v26->_header.numberOfUpdates + 1);
  v6 = *(float *)((char *)&v26->_header.frequency + 3);
  v7 = -[NSMutableArray count](v26->_flipBookData, "count");
  ambient = v26->_header.ambient;
  brightness = v26->_origin.brightness;
  brightnessLimit = v26->_origin.brightnessLimit;
  v11 = v26->_origin.whitepoint.matrix[2][2];
  x = v26->_origin.whitepoint.xy.x;
  y = v26->_origin.whitepoint.xy.y;
  pccFactor = v26->_origin.pccFactor;
  twilightStrength = v26->_origin.twilightStrength;
  twilightLux = v26->_origin.twilightLux;
  ammoliteStrength = v26->_origin.ammoliteStrength;
  v18 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 5);
  v19 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 52);
  v20 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 47);
  v21 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 57);
  v22 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 61);
  v23 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 66);
  return (id)objc_msgSend(v24, "stringWithFormat:", CFSTR("%@:\nheader  lenght=%f | freq=%u | ambient=%f | count=%lu \norigin  SDR=%f | limit=%f | pcc=%f | wp.x=%f | wp.y=%f | wp.Y=%f | twl = %f | twlLux = %f | aml = %f | amlLux = %f\nfinal   SDR=%f | limit=%f | pcc=%f | twl = %f | twlLux = %f | aml = %f | amlLux = %f"), v3, *(_QWORD *)&v4, v5, *(_QWORD *)&v6, v7, *(_QWORD *)&ambient, *(_QWORD *)&brightness, *(_QWORD *)&brightnessLimit, *(_QWORD *)&v11, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&pccFactor, *(_QWORD *)&twilightStrength, *(_QWORD *)&twilightLux, *(_QWORD *)&ammoliteStrength, *(_QWORD *)&v18,
               *(_QWORD *)&v19,
               *(_QWORD *)&v20,
               *(_QWORD *)&v21,
               *(_QWORD *)&v22,
               *(_QWORD *)&v23,
               *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 70));
}

- (void)appendFlipBookEntry:(id *)a3
{
  unsigned int v3;
  CBAODFlipBookEntryWrapper *v4;
  _BYTE __dst[79];
  CBAODFlipBookEntryWrapper *v6;
  $7D12C9F9DF7F825FC3F2BA39AA26C9BC *v7;
  SEL v8;
  CBAODFlipBookWrapper *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  a3->var0 = -[NSMutableArray count](self->_flipBookData, "count");
  v6 = 0;
  v4 = [CBAODFlipBookEntryWrapper alloc];
  memcpy(__dst, v7, sizeof(__dst));
  v6 = -[CBAODFlipBookEntryWrapper initWithFlipBookEntry:](v4, "initWithFlipBookEntry:", __dst);
  -[NSMutableArray addObject:](v9->_flipBookData, "addObject:", v6);

  v3 = -[NSMutableArray count](v9->_flipBookData, "count");
  *(unsigned int *)((char *)&v9->_header.sizeOfEntry + 1) = v3;
}

- (BOOL)getEntry:(id *)a3 forID:(int64_t)a4
{
  void *__src;
  BOOL v6;

  v6 = 0;
  if (-[CBAODFlipBookWrapper isValidEntryID:](self, "isValidEntryID:", a4))
  {
    __src = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_flipBookData, "objectAtIndex:", a4), "entry");
    if (__src)
    {
      memcpy(a3, __src, 0x4FuLL);
      return 1;
    }
  }
  return v6;
}

- (id)newFlipBookData
{
  int i;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v4, "appendBytes:length:", &self->_header, 23);
  for (i = 0; i < (unint64_t)-[NSMutableArray count](self->_flipBookData, "count"); ++i)
    objc_msgSend(v4, "appendData:", objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_flipBookData, "objectAtIndexedSubscript:", i), "entryData"));
  return v4;
}

- (unint64_t)entryCount
{
  return -[NSMutableArray count](self->_flipBookData, "count", a2, self);
}

- (BOOL)isValidEntryID:(int64_t)a3
{
  BOOL v4;

  v4 = 0;
  if (a3 >= 0)
    return a3 < (unint64_t)-[NSMutableArray count](self->_flipBookData, "count");
  return v4;
}

- ($ADF2D17A2D0006A1E21E182AFD270E1C)header
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var6;
  *(_QWORD *)((char *)&retstr->var3 + 3) = *(_QWORD *)((char *)&self[1].var2 + 3);
  return self;
}

- ($22B845C3FD2DCB84D05BF442A0079DD7)origin
{
  return ($22B845C3FD2DCB84D05BF442A0079DD7 *)memcpy(retstr, &self->_header.ambient, sizeof($22B845C3FD2DCB84D05BF442A0079DD7));
}

- (double)submissionTimestamp
{
  return self->_submissionTimestamp;
}

- (void)setSubmissionTimestamp:(double)a3
{
  self->_submissionTimestamp = a3;
}

@end
