@implementation HDFakeDataCollectorConfiguration

+ (id)configurationForWorkoutActivityType:(unint64_t)a3
{
  HDFakeDataCollectorConfiguration *v4;
  HDFakeDataCollectorConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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

  v4 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  v5 = v4;
  if ((uint64_t)a3 > 45)
  {
    switch(a3)
    {
      case '.':
        v25 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "quantityWithUnit:doubleValue:", v26, 7.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v27);

        v9 = 6;
        break;
      case '4':
        v28 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "quantityWithUnit:doubleValue:", v29, 2.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v30);

        v9 = 1;
        break;
      case '<':
        v10 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, 2.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v12);

        v9 = 11;
        break;
      default:
LABEL_10:
        -[HDFakeDataCollectorConfiguration setSpeed:](v4, "setSpeed:", 0);
        v9 = 4;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x1FuLL:
        v6 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "quantityWithUnit:doubleValue:", v7, 2.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v8);

        v9 = 8;
        break;
      case 0x20uLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x24uLL:
      case 0x26uLL:
        goto LABEL_10;
      case 0x23uLL:
        v16 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17, 4.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v18);

        v9 = 10;
        break;
      case 0x25uLL:
        v19 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20, 4.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v21);

        v9 = 2;
        break;
      case 0x27uLL:
        v22 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "quantityWithUnit:doubleValue:", v23, 4.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v24);

        v9 = 9;
        break;
      default:
        if (a3 != 13)
          goto LABEL_10;
        v13 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14, 10.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFakeDataCollectorConfiguration setSpeed:](v5, "setSpeed:", v15);

        v9 = 3;
        break;
    }
  }
  -[HDFakeDataCollectorConfiguration setActivityType:](v5, "setActivityType:", v9);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_speed == (HKQuantity *)v4[2] && self->_activityType == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_activityType ^ (int64_t)self->_speed;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDFakeDataCollectorConfiguration *v4;

  v4 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  -[HDFakeDataCollectorConfiguration setSpeed:](v4, "setSpeed:", self->_speed);
  -[HDFakeDataCollectorConfiguration setActivityType:](v4, "setActivityType:", self->_activityType);
  return v4;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (HKQuantity)speed
{
  return self->_speed;
}

- (void)setSpeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speed, 0);
}

@end
