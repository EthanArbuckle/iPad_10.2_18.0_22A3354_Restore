@implementation CLReductiveFilterOptions

- (CLReductiveFilterOptions)init
{
  return (CLReductiveFilterOptions *)((uint64_t (*)(CLReductiveFilterOptions *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithBeaconType_, 0);
}

- (CLReductiveFilterOptions)initWithBeaconType:(unint64_t)a3
{
  return (CLReductiveFilterOptions *)((uint64_t (*)(CLReductiveFilterOptions *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self, sel_initWithBeaconType_transmitPower_, a3);
}

- (CLReductiveFilterOptions)initWithBeaconType:(unint64_t)a3 transmitPower:(double)a4
{
  char *v6;
  CLReductiveFilterOptions *v7;
  NSObject *v9;
  NSObject *v10;
  double v11;
  objc_super v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CLReductiveFilterOptions;
  v6 = -[CLReductiveFilterOptions init](&v13, sel_init);
  v7 = (CLReductiveFilterOptions *)v6;
  if (v6)
  {
    *((_QWORD *)v6 + 1) = a3;
    *(_OWORD *)(v6 + 24) = xmmword_18F7758A0;
    if (a4 < 4.0 || a4 > 20.0)
    {
      if (qword_1EE172108 != -1)
        dispatch_once(&qword_1EE172108, &unk_1E2990950);
      v9 = qword_1EE172110;
      if (os_log_type_enabled((os_log_t)qword_1EE172110, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289794;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v18 = 2050;
        v19 = a4;
        v20 = 2050;
        v21 = 0x4010000000000000;
        v22 = 2050;
        v23 = 0x4034000000000000;
        _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"transmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\", \"min.TransmitPower_dBm\":\"%{public}.6f\", \"max.TransmitPower_dBm\":\"%{public}.6f\"}", buf, 0x30u);
        if (qword_1EE172108 != -1)
          dispatch_once(&qword_1EE172108, &unk_1E2990950);
      }
      v10 = qword_1EE172110;
      if (os_signpost_enabled((os_log_t)qword_1EE172110))
      {
        *(_DWORD *)buf = 68289794;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v18 = 2050;
        v19 = a4;
        v20 = 2050;
        v21 = 0x4010000000000000;
        v22 = 2050;
        v23 = 0x4034000000000000;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "transmitPower: invalid range of transmit power", "{\"msg%{public}.0s\":\"transmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\", \"min.TransmitPower_dBm\":\"%{public}.6f\", \"max.TransmitPower_dBm\":\"%{public}.6f\"}", buf, 0x30u);
      }
      v11 = 4.0;
      if (a4 >= 4.0)
        v11 = a4;
      a4 = fmin(v11, 20.0);
    }
    v7->_transmitPower = a4;
  }
  return v7;
}

- (unint64_t)beaconType
{
  return self->_beaconType;
}

- (double)transmitPower
{
  return self->_transmitPower;
}

- (double)biasRateInMeasurement
{
  return self->_biasRateInMeasurement;
}

- (void)setBiasRateInMeasurement:(double)a3
{
  self->_biasRateInMeasurement = a3;
}

- (double)applyRangeEstimation
{
  return self->_applyRangeEstimation;
}

- (void)setApplyRangeEstimation:(double)a3
{
  self->_applyRangeEstimation = a3;
}

@end
