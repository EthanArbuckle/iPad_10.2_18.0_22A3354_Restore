@implementation _DPStringRandomizer

- (_DPStringRandomizer)init
{

  return 0;
}

- (_DPStringRandomizer)initWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6 huffmanTableClass:(id)a7
{
  id v11;
  _DPStringRandomizer *v12;
  id *p_isa;
  _DPStringRandomizer *v14;
  _DPStringRandomizer *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  __objc2_class *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  _DPStringRandomizer *v37;
  __objc2_class *v38;
  void *v39;
  uint64_t v40;
  _DPStringRandomizer *v41;
  id v42;
  uint64_t v43;
  __objc2_class *v44;
  uint64_t v45;
  double v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  BOOL v53;
  BOOL v54;
  BOOL v55;
  BOOL v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  __objc2_class *v66;
  void *v68;
  objc_super v69;

  v11 = a6;
  v69.receiver = self;
  v69.super_class = (Class)_DPStringRandomizer;
  v12 = -[_DPStringRandomizer init](&v69, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (!v12)
  {
LABEL_82:
    v14 = p_isa;
    goto LABEL_92;
  }
  v14 = 0;
  v12->_algorithm = a4;
  switch(a4)
  {
    case 1uLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p"));
      v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      if (v14
        || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequenceP")),
            (v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        +[_DPOBHRandomizer obhRandomizerWithDimensionality:epsilon:](_DPOBHRandomizer, "obhRandomizerWithDimensionality:epsilon:", -[_DPStringRandomizer unsignedIntegerValue](v14, "unsignedIntegerValue"), a3);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
          goto LABEL_40;
        goto LABEL_90;
      }
      goto LABEL_92;
    case 2uLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("m"));
      v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      if (v14
        || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequenceM")),
            (v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("k"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequenceK"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
            goto LABEL_90;
        }
        if (a5 != 3)
        {
          v66 = _DPCMSRandomizer;
          goto LABEL_78;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequenceFragmentBias"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_89;
        v19 = v18;
        objc_msgSend(v18, "doubleValue");
        v21 = v20;
        objc_msgSend(v19, "doubleValue");
        v23 = v22;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fragmentM"));
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fragmentK"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
            goto LABEL_87;
          v27 = (1.0 - v21) * a3;
          v28 = v23 * a3;
          v29 = _DPCMSRandomizer;
          goto LABEL_28;
        }
        goto LABEL_88;
      }
      goto LABEL_92;
    case 4uLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("m"));
      v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequenceM"));
        v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_92;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("k"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequenceK"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_90;
      }
      if (a5 == 3)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequenceFragmentBias"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_89;
        v19 = v30;
        objc_msgSend(v30, "doubleValue");
        v32 = v31;
        objc_msgSend(v19, "doubleValue");
        v34 = v33;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fragmentM"));
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v25 = (void *)v35;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fragmentK"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (1.0 - v32) * a3;
            v28 = v34 * a3;
            v29 = _DPHCMSRandomizer;
LABEL_28:
            -[__objc2_class randomizerWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:](v29, "randomizerWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:", -[_DPStringRandomizer unsignedIntegerValue](v14, "unsignedIntegerValue"), objc_msgSend(v17, "unsignedIntegerValue"), objc_msgSend(v25, "unsignedIntegerValue"), objc_msgSend(v26, "unsignedIntegerValue"), v28, v27);
            v36 = objc_claimAutoreleasedReturnValue();

            if (!v36)
              goto LABEL_89;
LABEL_79:
            v47 = p_isa[1];
            p_isa[1] = (id)v36;
            goto LABEL_80;
          }
LABEL_87:

        }
LABEL_88:

      }
      else
      {
        v66 = _DPHCMSRandomizer;
LABEL_78:
        -[__objc2_class randomizerWithEpsilon:bitCount:hashFunctionCount:](v66, "randomizerWithEpsilon:bitCount:hashFunctionCount:", -[_DPStringRandomizer unsignedIntegerValue](v14, "unsignedIntegerValue"), objc_msgSend(v17, "unsignedIntegerValue"), a3);
        v36 = objc_claimAutoreleasedReturnValue();
        if (v36)
          goto LABEL_79;
      }
LABEL_89:

LABEL_90:
LABEL_91:
      v14 = 0;
LABEL_92:

      return v14;
    case 5uLL:
    case 6uLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p"));
      v15 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      if (!v15)
        goto LABEL_92;
      +[_DPBitValueRandomizer bitValueRandomizerWithDimensionality:epsilon:](_DPBitValueRandomizer, "bitValueRandomizerWithDimensionality:epsilon:", -[_DPStringRandomizer unsignedIntegerValue](v15, "unsignedIntegerValue"), a3);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_90;
      goto LABEL_40;
    case 8uLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("numGroups"));
      v37 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      v14 = v37;
      if (!v37)
        goto LABEL_92;
      +[_DPPTValueRandomizer randomizerWithEpsilon:numberOfGroups:](_DPPTValueRandomizer, "randomizerWithEpsilon:numberOfGroups:", -[_DPStringRandomizer unsignedIntValue](v37, "unsignedIntValue"), a3);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_90;
      goto LABEL_40;
    case 9uLL:
      v38 = _DPPrioValueRandomizer;
      goto LABEL_70;
    case 0xAuLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("m"));
      v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_92;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("k"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
        goto LABEL_90;
      v17 = v39;
      +[_DPPrioCountMinSketchValueRandomizer randomizerWithEpsilon:bitCount:hashFunctionCount:](_DPPrioCountMinSketchValueRandomizer, "randomizerWithEpsilon:bitCount:hashFunctionCount:", -[_DPStringRandomizer unsignedIntValue](v14, "unsignedIntValue"), objc_msgSend(v39, "unsignedIntValue"), a3);
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_89;
      goto LABEL_51;
    case 0xBuLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p"));
      v41 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      v14 = v41;
      if (!v41)
        goto LABEL_92;
      +[_DPOHEBitValueRandomizer oheBitValueRandomizerWithDimensionality:epsilon:](_DPOHEBitValueRandomizer, "oheBitValueRandomizerWithDimensionality:epsilon:", -[_DPStringRandomizer unsignedIntegerValue](v41, "unsignedIntegerValue"), a3);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_90;
LABEL_40:
      v42 = p_isa[1];
      p_isa[1] = (id)v16;

      goto LABEL_81;
    case 0xCuLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("n"));
      v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_92;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("delta"));
      v43 = objc_claimAutoreleasedReturnValue();
      if (!v43)
        goto LABEL_90;
      v17 = (void *)v43;
      v44 = _DPPrioPlusPlusValueRandomizer;
      goto LABEL_47;
    case 0xDuLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("n"));
      v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_92;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("delta"));
      v45 = objc_claimAutoreleasedReturnValue();
      if (!v45)
        goto LABEL_90;
      v17 = (void *)v45;
      v44 = _DPPrioPlusPlusMetricsValueRandomizer;
LABEL_47:
      objc_msgSend(v17, "doubleValue");
      -[__objc2_class randomizerWithEpsilon:delta:maxLength:](v44, "randomizerWithEpsilon:delta:maxLength:", -[_DPStringRandomizer unsignedIntValue](v14, "unsignedIntValue"), a3, v46);
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_89;
LABEL_51:
      v47 = p_isa[1];
      p_isa[1] = (id)v40;
LABEL_80:

      goto LABEL_81;
    case 0xEuLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p"));
      v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_92;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dynamicVectorSize"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPPrioPlusPlusMetadataValueRandomizer randomizerWithEpsilon:dimensionality:dynamicVectorSize:](_DPPrioPlusPlusMetadataValueRandomizer, "randomizerWithEpsilon:dimensionality:dynamicVectorSize:", -[_DPStringRandomizer unsignedIntValue](v14, "unsignedIntValue"), objc_msgSend(v17, "BOOLValue"), a3);
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
        goto LABEL_51;
      goto LABEL_89;
    case 0xFuLL:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("prime"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("alpha0"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("alpha1"));
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v51;
      if (v48
        && (v49 ? (v53 = v50 == 0) : (v53 = 1),
            !v53 ? (v54 = v51 == 0) : (v54 = 1),
            !v54 || (!v49 ? (v55 = v50 == 0) : (v55 = 0), v55 ? (v56 = v51 == 0) : (v56 = 0), v56)))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dynamicVectorSize"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v68, "BOOLValue");
        v60 = objc_msgSend(v48, "unsignedIntegerValue");
        v61 = objc_msgSend(v49, "unsignedIntValue");
        objc_msgSend(v50, "doubleValue");
        v63 = v62;
        objc_msgSend(v52, "doubleValue");
        +[_DPPrioPiRapporValueRandomizer randomizerWithEpsilon:dimensionality:dynamicVectorSize:piRapporPrime:piRapporAlpha0:piRapporAlpha1:](_DPPrioPiRapporValueRandomizer, "randomizerWithEpsilon:dimensionality:dynamicVectorSize:piRapporPrime:piRapporAlpha0:piRapporAlpha1:", v60, v59, v61, a3, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          objc_storeStrong(p_isa + 1, v65);
          v57 = 2;
        }
        else
        {
          v57 = 1;
        }

      }
      else
      {
        v57 = 1;
      }

      if (v57 == 2)
        goto LABEL_82;
      goto LABEL_91;
    case 0x10uLL:
      v38 = _DPPrio3SumVectorRandomizer;
LABEL_70:
      -[__objc2_class randomizerWithEpsilon:parameters:](v38, "randomizerWithEpsilon:parameters:", v11, a3);
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_91;
      goto LABEL_73;
    case 0x11uLL:
      +[_DPPINERandomizer randomizerWithMaxCentralEpsilon:parameters:](_DPPINERandomizer, "randomizerWithMaxCentralEpsilon:parameters:", v11, a3);
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_91;
LABEL_73:
      v14 = (_DPStringRandomizer *)p_isa[1];
      p_isa[1] = (id)v58;
LABEL_81:

      goto LABEL_82;
    default:
      goto LABEL_92;
  }
}

- (_DPStringRandomizer)initWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 range:(unint64_t)a6
{
  _DPStringRandomizer *v10;
  _DPStringRandomizer *v11;
  uint64_t v12;
  _DPStringRandomizer *randomizer;
  _DPStringRandomizer *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_DPStringRandomizer;
  v10 = -[_DPStringRandomizer init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    if (a5 != 1
      || (v10->_algorithm = a4, a4 != 3)
      || (+[_DPNumberRandomizer numberRandomizerWithRange:epsilon:](_DPNumberRandomizer, "numberRandomizerWithRange:epsilon:", a6, a3), (v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v14 = 0;
      goto LABEL_8;
    }
    randomizer = v11->_randomizer;
    v11->_randomizer = (_DPStringRandomizer *)v12;

  }
  v14 = v11;
LABEL_8:

  return v14;
}

+ (id)stringRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6
{
  return (id)objc_msgSend(a1, "stringRandomizerWithEpsilon:privatizationAlgorithm:dataAlgorithm:algorithmParameters:huffmanTableClass:", a4, a5, a6, 0, a3);
}

+ (id)stringRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6 huffmanTableClass:(id)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a7;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:privatizationAlgorithm:dataAlgorithm:algorithmParameters:huffmanTableClass:", a4, a5, v13, v12, a3);

  return v14;
}

+ (id)numbersRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 range:(unint64_t)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:privatizationAlgorithm:dataAlgorithm:range:", a4, a5, a6, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { randomizer=%@ }"), v5, self->_randomizer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_DPStringRandomizer)randomizer
{
  return self->_randomizer;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomizer, 0);
}

@end
