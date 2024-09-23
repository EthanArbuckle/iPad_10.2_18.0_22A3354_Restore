@implementation GEOComposedRouteCellularCoverage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteCellularCoverage)init
{
  GEOComposedRouteCellularCoverage *result;

  result = (GEOComposedRouteCellularCoverage *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOComposedRouteCellularCoverage)initWithOffsets:(id)a3 coverage:(id)a4 routeLength:(double)a5
{
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  GEOComposedRouteCellularCoverage *v14;
  GEOComposedRouteCellularCoverage *v15;
  NSObject *v17;
  const char *v18;
  objc_super v19;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "length");
  v12 = objc_msgSend(v10, "length");
  if ((v11 & 0xFFFFFFFFFFFFFFFCLL) != objc_msgSend(v9, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E0C81028];
      v18 = "Assertion failed: offsetsCount * sizeof(uint32_t) == offsetsData.length";
      goto LABEL_14;
    }
LABEL_12:

    v15 = 0;
    goto LABEL_6;
  }
  if ((v12 & 0xFFFFFFFFFFFFFFFCLL) != objc_msgSend(v10, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E0C81028];
      v18 = "Assertion failed: coverageCount * sizeof(GEOCellularCoverage) == coverageData.length";
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v13 = v11 >> 2;
  if (v13 != v12 >> 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    v18 = "Assertion failed: offsetsCount == coverageCount";
LABEL_14:
    _os_log_fault_impl(&dword_1885A9000, v17, OS_LOG_TYPE_FAULT, v18, buf, 2u);
    goto LABEL_12;
  }
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedRouteCellularCoverage;
  v14 = -[GEOComposedRouteCellularCoverage init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_offsetsData, a3);
    objc_storeStrong((id *)&v15->_coverageData, a4);
    v15->_offsets = (unsigned int *)-[NSData bytes](v15->_offsetsData, "bytes");
    v15->_coverage = (int *)-[NSData bytes](v15->_coverageData, "bytes");
    v15->_coverageCount = v13;
    v15->_routeLength = a5;
  }
LABEL_6:

  return v15;
}

- (GEOComposedRouteCellularCoverage)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteCellularCoverage *v5;
  GEOComposedRouteCellularCoverage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  double v11;
  GEOComposedRouteCellularCoverage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedRouteCellularCoverage;
  v5 = -[GEOComposedRouteCellularCoverage init](&v14, sel_init);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offsets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coverage"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("routeLength"));
      v6 = -[GEOComposedRouteCellularCoverage initWithOffsets:coverage:routeLength:](v6, "initWithOffsets:coverage:routeLength:", v7, v9, (double)(unint64_t)v11);
      v12 = v6;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *offsetsData;
  id v5;

  offsetsData = self->_offsetsData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", offsetsData, CFSTR("offsets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coverageData, CFSTR("coverage"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("routeLength"), self->_routeLength);

}

- (int)cellularCoverageAtOffset:(double)a3
{
  int v3;
  double routeLength;
  unint64_t coverageCount;
  int v6;
  unsigned int *offsets;
  int *coverage;
  unsigned int v9;
  unsigned int v10;
  int result;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  routeLength = self->_routeLength;
  if (routeLength < a3)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** offset %.2f beyond bounds [0 .. %.2f]"), *(_QWORD *)&a3, *(_QWORD *)&routeLength);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  coverageCount = self->_coverageCount;
  if (!coverageCount)
    return 0;
  v6 = 0;
  offsets = self->_offsets;
  coverage = self->_coverage;
  while (1)
  {
    v10 = *offsets++;
    v9 = v10;
    v12 = *coverage++;
    result = v12;
    if ((double)v9 == a3)
      v3 = result;
    if ((double)v9 > a3)
      v3 = v6;
    if ((double)v9 >= a3)
      break;
    v6 = result;
    if (!--coverageCount)
      return result;
  }
  return v3;
}

- (void)enumerateCoverageRangesWithBlock:(id)a3
{
  unint64_t v4;
  unint64_t coverageCount;
  unsigned int v6;
  unint64_t v7;
  unsigned int *offsets;
  unint64_t v9;
  double routeLength;
  void (**v11)(id, _QWORD, double, double);

  v11 = (void (**)(id, _QWORD, double, double))a3;
  coverageCount = self->_coverageCount;
  if (coverageCount)
  {
    v6 = *self->_offsets;
    if (!v6 || (v11[2](v11, 0, 0.0, (double)v6), (coverageCount = self->_coverageCount) != 0))
    {
      v7 = 0;
      do
      {
        offsets = self->_offsets;
        if (v7 >= coverageCount - 1)
        {
          routeLength = self->_routeLength;
          v9 = v7 + 1;
        }
        else
        {
          v9 = v7 + 1;
          LODWORD(v4) = offsets[v7 + 1];
          routeLength = (double)v4;
        }
        LODWORD(v4) = offsets[v7];
        v11[2](v11, self->_coverage[v7], (double)v4, routeLength - (double)v4);
        coverageCount = self->_coverageCount;
        v7 = v9;
      }
      while (v9 < coverageCount);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverageData, 0);
  objc_storeStrong((id *)&self->_offsetsData, 0);
}

@end
