@implementation BiasEstimatorFeatures

- (BiasEstimatorFeatures)initWithBiasEstimatorFeatures:(id)a3
{
  id v5;
  BiasEstimatorFeatures *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  NSArray *cirPacket1;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  NSArray *cirPacket2;
  double v27;
  double v28;
  void *v30;
  objc_super v31;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UWBSignalFeatures.mm"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("features"));

  }
  v31.receiver = self;
  v31.super_class = (Class)BiasEstimatorFeatures;
  v6 = -[BiasEstimatorFeatures init](&v31, sel_init);
  if (v6)
  {
    v6->_antennaMask = objc_msgSend(v5, "antennaMask");
    objc_msgSend(v5, "uwbTime");
    v6->_uwbTime = v7;
    objc_msgSend(v5, "timestamp");
    v6->_timestamp = v8;
    objc_msgSend(v5, "tofPicSecond");
    v6->_tofPicSecond = v9;
    objc_msgSend(v5, "rssiDbm");
    v6->_rssiDbm = v10;
    objc_msgSend(v5, "soiRssiDbm");
    v6->_soiRssiDbm = v11;
    objc_msgSend(v5, "toaNoiseRms");
    v6->_toaNoiseRms = v12;
    objc_msgSend(v5, "toaPpwinRms");
    v6->_toaPpwinRms = v13;
    objc_msgSend(v5, "toaPpwinPeak");
    v6->_toaPpwinPeak = v14;
    objc_msgSend(v5, "rttInitiator");
    v6->_rttInitiator = v15;
    objc_msgSend(v5, "tatInitiator");
    v6->_tatInitiator = v16;
    objc_msgSend(v5, "rttResponder");
    v6->_rttResponder = v17;
    objc_msgSend(v5, "tatResponder");
    v6->_tatResponder = v18;
    objc_msgSend(v5, "cirPacket1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    cirPacket1 = v6->_cirPacket1;
    v6->_cirPacket1 = (NSArray *)v20;

    objc_msgSend(v5, "leadingEdgePacket1");
    v6->_leadingEdgePacket1 = v22;
    objc_msgSend(v5, "firstPathIndexPacket1");
    v6->_firstPathIndexPacket1 = v23;
    v6->_rxAntennaPacket1 = objc_msgSend(v5, "rxAntennaPacket1");
    objc_msgSend(v5, "cirPacket2");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    cirPacket2 = v6->_cirPacket2;
    v6->_cirPacket2 = (NSArray *)v25;

    objc_msgSend(v5, "leadingEdgePacket2");
    v6->_leadingEdgePacket2 = v27;
    objc_msgSend(v5, "firstPathIndexPacket2");
    v6->_firstPathIndexPacket2 = v28;
    v6->_rxAntennaPacket2 = objc_msgSend(v5, "rxAntennaPacket2");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_antennaMask, CFSTR("antennaMask"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("uwbTime"), self->_uwbTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("tofPicSecond"), self->_tofPicSecond);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rssiDbm"), self->_rssiDbm);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("soiRssiDbm"), self->_soiRssiDbm);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("toaNoiseRms"), self->_toaNoiseRms);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("toaPpwinRms"), self->_toaPpwinRms);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("toaPpwinPeak"), self->_toaPpwinPeak);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rttInitiator"), self->_rttInitiator);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("tatInitiator"), self->_tatInitiator);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rttResponder"), self->_rttResponder);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("tatResponder"), self->_tatResponder);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cirPacket1, CFSTR("cirPacket1"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("leadingEdgePacket1"), self->_leadingEdgePacket1);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("firstPathIndexPacket1"), self->_firstPathIndexPacket1);
  objc_msgSend(v4, "encodeInt:forKey:", self->_rxAntennaPacket1, CFSTR("rxAntennaPacket1"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cirPacket2, CFSTR("cirPacket2"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("leadingEdgePacket2"), self->_leadingEdgePacket2);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("firstPathIndexPacket2"), self->_firstPathIndexPacket2);
  objc_msgSend(v4, "encodeInt:forKey:", self->_rxAntennaPacket2, CFSTR("rxAntennaPacket2"));

}

- (BiasEstimatorFeatures)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  BiasEstimatorFeatures *v34;
  BiasEstimatorFeatures *v35;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("antennaMask"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("uwbTime"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tofPicSecond"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("soiRssiDbm"));
  v44 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rssiDbm"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("toaNoiseRms"));
  v43 = v15;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("toaPpwinRms"));
  v42 = v16;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("toaPpwinPeak"));
  v41 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rttInitiator"));
  v40 = v18;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tatInitiator"));
  v39 = v19;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rttResponder"));
  v38 = v20;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tatResponder"));
  v37 = v21;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("cirPacket1"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("leadingEdgePacket1"));
  v24 = v23;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstPathIndexPacket1"));
  v26 = v25;
  v27 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rxAntennaPacket1"));
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("cirPacket2"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("leadingEdgePacket2"));
  v30 = v29;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstPathIndexPacket2"));
  v32 = v31;
  v33 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rxAntennaPacket2"));
  v45.receiver = self;
  v45.super_class = (Class)BiasEstimatorFeatures;
  v34 = -[BiasEstimatorFeatures init](&v45, sel_init);
  v35 = v34;
  if (v34)
  {
    -[BiasEstimatorFeatures setAntennaMask:](v34, "setAntennaMask:", v5);
    -[BiasEstimatorFeatures setUwbTime:](v35, "setUwbTime:", v7);
    -[BiasEstimatorFeatures setTimestamp:](v35, "setTimestamp:", v9);
    -[BiasEstimatorFeatures setTofPicSecond:](v35, "setTofPicSecond:", v11);
    -[BiasEstimatorFeatures setRssiDbm:](v35, "setRssiDbm:", v14);
    -[BiasEstimatorFeatures setSoiRssiDbm:](v35, "setSoiRssiDbm:", v44);
    -[BiasEstimatorFeatures setToaNoiseRms:](v35, "setToaNoiseRms:", v43);
    -[BiasEstimatorFeatures setToaPpwinRms:](v35, "setToaPpwinRms:", v42);
    -[BiasEstimatorFeatures setToaPpwinPeak:](v35, "setToaPpwinPeak:", v41);
    -[BiasEstimatorFeatures setRttInitiator:](v35, "setRttInitiator:", v40);
    -[BiasEstimatorFeatures setTatInitiator:](v35, "setTatInitiator:", v39);
    -[BiasEstimatorFeatures setRttResponder:](v35, "setRttResponder:", v38);
    -[BiasEstimatorFeatures setTatResponder:](v35, "setTatResponder:", v37);
    -[BiasEstimatorFeatures setCirPacket1:](v35, "setCirPacket1:", v22);
    -[BiasEstimatorFeatures setLeadingEdgePacket1:](v35, "setLeadingEdgePacket1:", v24);
    -[BiasEstimatorFeatures setFirstPathIndexPacket1:](v35, "setFirstPathIndexPacket1:", v26);
    -[BiasEstimatorFeatures setRxAntennaPacket1:](v35, "setRxAntennaPacket1:", v27);
    -[BiasEstimatorFeatures setCirPacket2:](v35, "setCirPacket2:", v28);
    -[BiasEstimatorFeatures setLeadingEdgePacket2:](v35, "setLeadingEdgePacket2:", v30);
    -[BiasEstimatorFeatures setFirstPathIndexPacket2:](v35, "setFirstPathIndexPacket2:", v32);
    -[BiasEstimatorFeatures setRxAntennaPacket2:](v35, "setRxAntennaPacket2:", v33);
  }

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBiasEstimatorFeatures:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BiasEstimatorFeatures *v5;
  BiasEstimatorFeatures *v6;
  int antennaMask;
  int v8;
  double uwbTime;
  double v10;
  double v11;
  double timestamp;
  double v13;
  double v14;
  double rssiDbm;
  double v16;
  double v17;
  double soiRssiDbm;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSArray *cirPacket1;
  void *v30;
  void *v31;
  BOOL v32;
  BOOL v33;
  double v34;
  double v35;
  int rxAntennaPacket1;
  int v37;
  NSArray *cirPacket2;
  uint64_t v39;
  BOOL v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double leadingEdgePacket2;
  double v46;
  double v47;
  double firstPathIndexPacket2;
  double v49;
  double v50;
  int rxAntennaPacket2;
  int v52;
  BOOL v54;
  BOOL v55;
  BOOL v56;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double firstPathIndexPacket1;
  double v64;
  double leadingEdgePacket1;
  double v66;
  double tatResponder;
  double v68;
  double rttResponder;
  double v70;
  double tatInitiator;
  double v72;
  double rttInitiator;
  double v74;
  double toaPpwinPeak;
  double v76;
  double toaPpwinRms;
  double v78;
  double toaNoiseRms;
  double v80;
  double tofPicSecond;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (BiasEstimatorFeatures *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v56 = 1;
LABEL_36:

      goto LABEL_37;
    }
    antennaMask = self->_antennaMask;
    v8 = -[BiasEstimatorFeatures antennaMask](v5, "antennaMask");
    uwbTime = self->_uwbTime;
    -[BiasEstimatorFeatures uwbTime](v6, "uwbTime");
    v11 = v10;
    timestamp = self->_timestamp;
    -[BiasEstimatorFeatures timestamp](v6, "timestamp");
    v14 = v13;
    rssiDbm = self->_rssiDbm;
    -[BiasEstimatorFeatures rssiDbm](v6, "rssiDbm");
    v17 = v16;
    soiRssiDbm = self->_soiRssiDbm;
    -[BiasEstimatorFeatures soiRssiDbm](v6, "soiRssiDbm");
    v20 = v19;
    tofPicSecond = self->_tofPicSecond;
    -[BiasEstimatorFeatures tofPicSecond](v6, "tofPicSecond");
    v80 = v21;
    toaNoiseRms = self->_toaNoiseRms;
    -[BiasEstimatorFeatures toaNoiseRms](v6, "toaNoiseRms");
    v78 = v22;
    toaPpwinRms = self->_toaPpwinRms;
    -[BiasEstimatorFeatures toaPpwinRms](v6, "toaPpwinRms");
    v76 = v23;
    toaPpwinPeak = self->_toaPpwinPeak;
    -[BiasEstimatorFeatures toaPpwinPeak](v6, "toaPpwinPeak");
    v74 = v24;
    rttInitiator = self->_rttInitiator;
    -[BiasEstimatorFeatures rttInitiator](v6, "rttInitiator");
    v72 = v25;
    tatInitiator = self->_tatInitiator;
    -[BiasEstimatorFeatures tatInitiator](v6, "tatInitiator");
    v70 = v26;
    rttResponder = self->_rttResponder;
    -[BiasEstimatorFeatures rttResponder](v6, "rttResponder");
    v68 = v27;
    tatResponder = self->_tatResponder;
    -[BiasEstimatorFeatures tatResponder](v6, "tatResponder");
    v66 = v28;
    cirPacket1 = self->_cirPacket1;
    if (!cirPacket1)
    {
      -[BiasEstimatorFeatures cirPacket1](v6, "cirPacket1");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v33 = 0;
LABEL_7:
        leadingEdgePacket1 = self->_leadingEdgePacket1;
        -[BiasEstimatorFeatures leadingEdgePacket1](v6, "leadingEdgePacket1");
        v64 = v34;
        firstPathIndexPacket1 = self->_firstPathIndexPacket1;
        -[BiasEstimatorFeatures firstPathIndexPacket1](v6, "firstPathIndexPacket1");
        v62 = v35;
        rxAntennaPacket1 = self->_rxAntennaPacket1;
        v37 = -[BiasEstimatorFeatures rxAntennaPacket1](v6, "rxAntennaPacket1");
        cirPacket2 = self->_cirPacket2;
        v60 = v17;
        v61 = rssiDbm;
        v58 = v20;
        v59 = soiRssiDbm;
        if (!cirPacket2)
        {
          -[BiasEstimatorFeatures cirPacket2](v6, "cirPacket2");
          v39 = objc_claimAutoreleasedReturnValue();

          if (!v39)
          {
            v41 = v14;
            v42 = timestamp;
            v43 = v11;
            v44 = uwbTime;
            goto LABEL_11;
          }
          cirPacket2 = self->_cirPacket2;
        }
        -[BiasEstimatorFeatures cirPacket2](v6, "cirPacket2");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = -[NSArray isEqualToArray:](cirPacket2, "isEqualToArray:", v39);
        v41 = v14;
        v42 = timestamp;
        v43 = v11;
        v44 = uwbTime;

        LOBYTE(v39) = !v40;
LABEL_11:
        leadingEdgePacket2 = self->_leadingEdgePacket2;
        -[BiasEstimatorFeatures leadingEdgePacket2](v6, "leadingEdgePacket2");
        v47 = v46;
        firstPathIndexPacket2 = self->_firstPathIndexPacket2;
        -[BiasEstimatorFeatures firstPathIndexPacket2](v6, "firstPathIndexPacket2");
        v50 = v49;
        rxAntennaPacket2 = self->_rxAntennaPacket2;
        v52 = -[BiasEstimatorFeatures rxAntennaPacket2](v6, "rxAntennaPacket2");
        v54 = v44 != v43 || antennaMask != v8;
        if (v42 != v41)
          v54 = 1;
        if (tofPicSecond != v80)
          v54 = 1;
        if (v61 != v60)
          v54 = 1;
        if (v59 != v58)
          v54 = 1;
        if (toaNoiseRms != v78)
          v54 = 1;
        if (toaPpwinRms != v76)
          v54 = 1;
        v55 = (leadingEdgePacket2 == v47) & ~((v54
                                            || toaPpwinPeak != v74
                                            || rttInitiator != v72
                                            || tatInitiator != v70
                                            || rttResponder != v68
                                            || tatResponder != v66
                                            || v33
                                            || leadingEdgePacket1 != v64
                                            || firstPathIndexPacket1 != v62) | (rxAntennaPacket1 != v37) | v39);
        if (firstPathIndexPacket2 != v50)
          v55 = 0;
        v56 = rxAntennaPacket2 == v52 && v55;
        goto LABEL_36;
      }
      cirPacket1 = self->_cirPacket1;
    }
    -[BiasEstimatorFeatures cirPacket1](v6, "cirPacket1");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[NSArray isEqualToArray:](cirPacket1, "isEqualToArray:", v31);

    v33 = !v32;
    goto LABEL_7;
  }
  v56 = 0;
LABEL_37:

  return v56;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSArray *cirPacket1;
  void *v8;
  NSArray *cirPacket2;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR("AntennaMask: %d"), self->_antennaMask);
  objc_msgSend(v6, "appendFormat:", CFSTR(", current Timestamp: %f"), *(_QWORD *)&self->_timestamp);
  objc_msgSend(v6, "appendFormat:", CFSTR(", uwbTime: %f"), *(_QWORD *)&self->_uwbTime);
  objc_msgSend(v6, "appendFormat:", CFSTR(", tofPicSecond: %f"), *(_QWORD *)&self->_tofPicSecond);
  objc_msgSend(v6, "appendFormat:", CFSTR(", rssiDbm: %.3f"), *(_QWORD *)&self->_rssiDbm);
  objc_msgSend(v6, "appendFormat:", CFSTR(", soiRssiDbm: %.3f"), *(_QWORD *)&self->_soiRssiDbm);
  objc_msgSend(v6, "appendFormat:", CFSTR(", toaNoiseRms: %d"), (int)self->_toaNoiseRms);
  objc_msgSend(v6, "appendFormat:", CFSTR(", toaPpwinRms: %d"), (int)self->_toaPpwinRms);
  objc_msgSend(v6, "appendFormat:", CFSTR(", toaPpwinPeak: %d"), (int)self->_toaPpwinPeak);
  objc_msgSend(v6, "appendFormat:", CFSTR(", rttInitiator: %d"), (int)self->_rttInitiator);
  objc_msgSend(v6, "appendFormat:", CFSTR(", tatInitiator: %d"), (int)self->_tatInitiator);
  objc_msgSend(v6, "appendFormat:", CFSTR(", rttResponder: %d"), (int)self->_rttResponder);
  objc_msgSend(v6, "appendFormat:", CFSTR(", tatResponder: %d"), (int)self->_tatResponder);
  cirPacket1 = self->_cirPacket1;
  if (cirPacket1)
  {
    -[NSArray description](cirPacket1, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", cirPacket1: %@"), v8);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", leadingEdgePacket1: %d"), (int)self->_leadingEdgePacket1);
  objc_msgSend(v6, "appendFormat:", CFSTR(", firstPathIndexPacket1: %d"), (int)self->_firstPathIndexPacket1);
  objc_msgSend(v6, "appendFormat:", CFSTR(", rxAntennaPacket1: %d"), self->_rxAntennaPacket1);
  cirPacket2 = self->_cirPacket2;
  if (cirPacket2)
  {
    -[NSArray description](cirPacket2, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", cirPacket1: %@"), v10);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", leadingEdgePacket2: %d"), (int)self->_leadingEdgePacket2);
  objc_msgSend(v6, "appendFormat:", CFSTR(", firstPathIndexPacket2: %d"), (int)self->_firstPathIndexPacket2);
  objc_msgSend(v6, "appendFormat:", CFSTR(", rxAntennaPacket2: %d>"), self->_rxAntennaPacket2);
  return v6;
}

- (id)populateOrderedInputFeature
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%d, %f, %f, %d, %.3f, %.3f"), self->_antennaMask, *(_QWORD *)&self->_timestamp, *(_QWORD *)&self->_uwbTime, (int)self->_tofPicSecond, *(_QWORD *)&self->_rssiDbm, *(_QWORD *)&self->_soiRssiDbm);
  objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d, %d"), (int)self->_toaNoiseRms, (int)self->_toaPpwinRms, (int)self->_toaPpwinPeak);
  objc_msgSend(v3, "appendFormat:", CFSTR(", %llu, %llu, %llu, %llu"), (unint64_t)self->_rttInitiator, (unint64_t)self->_tatInitiator, (unint64_t)self->_rttResponder, (unint64_t)self->_tatResponder);
  for (i = 0; -[NSArray count](self->_cirPacket1, "count") > i; ++i)
  {
    -[NSArray objectAtIndex:](self->_cirPacket1, "objectAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "real");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndex:](self->_cirPacket1, "objectAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d"), objc_msgSend(v6, "intValue"), objc_msgSend(v8, "intValue"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d, %d"), (int)self->_leadingEdgePacket1, (int)self->_firstPathIndexPacket1, self->_rxAntennaPacket1);
  for (j = 0; -[NSArray count](self->_cirPacket2, "count") > j; ++j)
  {
    -[NSArray objectAtIndex:](self->_cirPacket2, "objectAtIndex:", j);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "real");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndex:](self->_cirPacket2, "objectAtIndex:", j);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d"), objc_msgSend(v11, "intValue"), objc_msgSend(v13, "intValue"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", %d, %d, %d"), (int)self->_leadingEdgePacket2, (int)self->_firstPathIndexPacket2, self->_rxAntennaPacket2);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_antennaMask);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v43, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_uwbTime);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v42, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v41, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_tofPicSecond);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v40, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rssiDbm);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v39, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_soiRssiDbm);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v38, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_toaNoiseRms);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v37, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_toaPpwinRms);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v36, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_toaPpwinPeak);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v35, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rttInitiator);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v34, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_tatInitiator);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v32, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rttResponder);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_tatResponder);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v26, "hash");
  v15 = -[NSArray hash](self->_cirPacket1, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leadingEdgePacket1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v22, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPathIndexPacket1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rxAntennaPacket1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = -[NSArray hash](self->_cirPacket2, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leadingEdgePacket2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPathIndexPacket2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rxAntennaPacket2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31 ^ v33 ^ v30 ^ v28 ^ v27 ^ v25 ^ v24 ^ v23 ^ v21 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v5 ^ v6 ^ v8 ^ v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (int)antennaMask
{
  return self->_antennaMask;
}

- (void)setAntennaMask:(int)a3
{
  self->_antennaMask = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)uwbTime
{
  return self->_uwbTime;
}

- (void)setUwbTime:(double)a3
{
  self->_uwbTime = a3;
}

- (double)tofPicSecond
{
  return self->_tofPicSecond;
}

- (void)setTofPicSecond:(double)a3
{
  self->_tofPicSecond = a3;
}

- (double)rssiDbm
{
  return self->_rssiDbm;
}

- (void)setRssiDbm:(double)a3
{
  self->_rssiDbm = a3;
}

- (double)soiRssiDbm
{
  return self->_soiRssiDbm;
}

- (void)setSoiRssiDbm:(double)a3
{
  self->_soiRssiDbm = a3;
}

- (double)toaNoiseRms
{
  return self->_toaNoiseRms;
}

- (void)setToaNoiseRms:(double)a3
{
  self->_toaNoiseRms = a3;
}

- (double)toaPpwinRms
{
  return self->_toaPpwinRms;
}

- (void)setToaPpwinRms:(double)a3
{
  self->_toaPpwinRms = a3;
}

- (double)toaPpwinPeak
{
  return self->_toaPpwinPeak;
}

- (void)setToaPpwinPeak:(double)a3
{
  self->_toaPpwinPeak = a3;
}

- (double)rttInitiator
{
  return self->_rttInitiator;
}

- (void)setRttInitiator:(double)a3
{
  self->_rttInitiator = a3;
}

- (double)tatInitiator
{
  return self->_tatInitiator;
}

- (void)setTatInitiator:(double)a3
{
  self->_tatInitiator = a3;
}

- (double)rttResponder
{
  return self->_rttResponder;
}

- (void)setRttResponder:(double)a3
{
  self->_rttResponder = a3;
}

- (double)tatResponder
{
  return self->_tatResponder;
}

- (void)setTatResponder:(double)a3
{
  self->_tatResponder = a3;
}

- (NSArray)cirPacket1
{
  return self->_cirPacket1;
}

- (void)setCirPacket1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (double)leadingEdgePacket1
{
  return self->_leadingEdgePacket1;
}

- (void)setLeadingEdgePacket1:(double)a3
{
  self->_leadingEdgePacket1 = a3;
}

- (double)firstPathIndexPacket1
{
  return self->_firstPathIndexPacket1;
}

- (void)setFirstPathIndexPacket1:(double)a3
{
  self->_firstPathIndexPacket1 = a3;
}

- (int)rxAntennaPacket1
{
  return self->_rxAntennaPacket1;
}

- (void)setRxAntennaPacket1:(int)a3
{
  self->_rxAntennaPacket1 = a3;
}

- (NSArray)cirPacket2
{
  return self->_cirPacket2;
}

- (void)setCirPacket2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (double)leadingEdgePacket2
{
  return self->_leadingEdgePacket2;
}

- (void)setLeadingEdgePacket2:(double)a3
{
  self->_leadingEdgePacket2 = a3;
}

- (double)firstPathIndexPacket2
{
  return self->_firstPathIndexPacket2;
}

- (void)setFirstPathIndexPacket2:(double)a3
{
  self->_firstPathIndexPacket2 = a3;
}

- (int)rxAntennaPacket2
{
  return self->_rxAntennaPacket2;
}

- (void)setRxAntennaPacket2:(int)a3
{
  self->_rxAntennaPacket2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cirPacket2, 0);
  objc_storeStrong((id *)&self->_cirPacket1, 0);
}

@end
