@implementation VPNInterfaceByteCountAccumulator

- (VPNInterfaceByteCountAccumulator)init
{
  VPNInterfaceByteCountAccumulator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VPNInterfaceByteCountAccumulator;
  result = -[VPNInterfaceByteCountAccumulator init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_currentVPNInterfaceByteCounts.txWiFiBytes = 0u;
    *(_OWORD *)&result->_currentVPNInterfaceByteCounts.rxWiredBytes = 0u;
    *(_OWORD *)&result->_currentVPNInterfaceByteCounts.rxCellularBytes = 0u;
  }
  return result;
}

- (void)addBytesToAttributeToVPNProviderFromSnapshot:(id)a3
{
  id v4;
  unint64_t rxCellularBytes;
  uint64_t v6;
  unint64_t v7;
  unint64_t rxWiFiBytes;
  uint64_t v9;
  unint64_t v10;
  unint64_t rxWiredBytes;
  uint64_t v12;
  unint64_t v13;
  unint64_t txCellularBytes;
  uint64_t v15;
  unint64_t v16;
  unint64_t txWiFiBytes;
  uint64_t v18;
  unint64_t v19;
  unint64_t txWiredBytes;
  uint64_t v21;
  unint64_t v22;
  id v23;

  v4 = a3;
  rxCellularBytes = self->_currentVPNInterfaceByteCounts.rxCellularBytes;
  v23 = v4;
  v6 = objc_msgSend(v4, "deltaAccountingRxCellularBytes");
  v7 = rxCellularBytes + v6;
  if (__CFADD__(rxCellularBytes, v6))
    v7 = -1;
  self->_currentVPNInterfaceByteCounts.rxCellularBytes = v7;
  rxWiFiBytes = self->_currentVPNInterfaceByteCounts.rxWiFiBytes;
  v9 = objc_msgSend(v23, "deltaAccountingRxWiFiBytes");
  v10 = rxWiFiBytes + v9;
  if (__CFADD__(rxWiFiBytes, v9))
    v10 = -1;
  self->_currentVPNInterfaceByteCounts.rxWiFiBytes = v10;
  rxWiredBytes = self->_currentVPNInterfaceByteCounts.rxWiredBytes;
  v12 = objc_msgSend(v23, "deltaAccountingRxWiredBytes");
  v13 = rxWiredBytes + v12;
  if (__CFADD__(rxWiredBytes, v12))
    v13 = -1;
  self->_currentVPNInterfaceByteCounts.rxWiredBytes = v13;
  txCellularBytes = self->_currentVPNInterfaceByteCounts.txCellularBytes;
  v15 = objc_msgSend(v23, "deltaAccountingTxCellularBytes");
  v16 = txCellularBytes + v15;
  if (__CFADD__(txCellularBytes, v15))
    v16 = -1;
  self->_currentVPNInterfaceByteCounts.txCellularBytes = v16;
  txWiFiBytes = self->_currentVPNInterfaceByteCounts.txWiFiBytes;
  v18 = objc_msgSend(v23, "deltaAccountingTxWiFiBytes");
  v19 = txWiFiBytes + v18;
  if (__CFADD__(txWiFiBytes, v18))
    v19 = -1;
  self->_currentVPNInterfaceByteCounts.txWiFiBytes = v19;
  txWiredBytes = self->_currentVPNInterfaceByteCounts.txWiredBytes;
  v21 = objc_msgSend(v23, "deltaAccountingTxWiredBytes");
  v22 = txWiredBytes + v21;
  if (__CFADD__(txWiredBytes, v21))
    v22 = -1;
  self->_currentVPNInterfaceByteCounts.txWiredBytes = v22;

}

- (void)subtractBytesAttributedToVPNProviderFromSnapshot:(id)a3
{
  unint64_t v4;
  unint64_t rxCellularBytes;
  unint64_t v6;
  unint64_t rxWiFiBytes;
  unint64_t v8;
  unint64_t rxWiredBytes;
  unint64_t v10;
  unint64_t txCellularBytes;
  unint64_t v12;
  unint64_t txWiFiBytes;
  unint64_t v14;
  unint64_t txWiredBytes;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;

  v41 = a3;
  v4 = objc_msgSend(v41, "deltaAccountingRxCellularBytes");
  rxCellularBytes = self->_currentVPNInterfaceByteCounts.rxCellularBytes;
  if (v4 < rxCellularBytes)
    rxCellularBytes = objc_msgSend(v41, "deltaAccountingRxCellularBytes");
  v6 = objc_msgSend(v41, "deltaAccountingRxWiFiBytes");
  rxWiFiBytes = self->_currentVPNInterfaceByteCounts.rxWiFiBytes;
  if (v6 < rxWiFiBytes)
    rxWiFiBytes = objc_msgSend(v41, "deltaAccountingRxWiFiBytes");
  v8 = objc_msgSend(v41, "deltaAccountingRxWiredBytes");
  rxWiredBytes = self->_currentVPNInterfaceByteCounts.rxWiredBytes;
  if (v8 < rxWiredBytes)
    rxWiredBytes = objc_msgSend(v41, "deltaAccountingRxWiredBytes");
  v10 = objc_msgSend(v41, "deltaAccountingTxCellularBytes");
  txCellularBytes = self->_currentVPNInterfaceByteCounts.txCellularBytes;
  if (v10 < txCellularBytes)
    txCellularBytes = objc_msgSend(v41, "deltaAccountingTxCellularBytes");
  v12 = objc_msgSend(v41, "deltaAccountingTxWiFiBytes");
  txWiFiBytes = self->_currentVPNInterfaceByteCounts.txWiFiBytes;
  if (v12 < txWiFiBytes)
    txWiFiBytes = objc_msgSend(v41, "deltaAccountingTxWiFiBytes");
  v14 = objc_msgSend(v41, "deltaAccountingTxWiredBytes");
  txWiredBytes = self->_currentVPNInterfaceByteCounts.txWiredBytes;
  if (v14 < txWiredBytes)
    txWiredBytes = objc_msgSend(v41, "deltaAccountingTxWiredBytes");
  v16 = self->_currentVPNInterfaceByteCounts.rxCellularBytes;
  v17 = v16 >= rxCellularBytes;
  v18 = v16 - rxCellularBytes;
  if (!v17)
    v18 = 0;
  self->_currentVPNInterfaceByteCounts.rxCellularBytes = v18;
  v19 = self->_currentVPNInterfaceByteCounts.rxWiFiBytes;
  v17 = v19 >= rxWiFiBytes;
  v20 = v19 - rxWiFiBytes;
  if (!v17)
    v20 = 0;
  self->_currentVPNInterfaceByteCounts.rxWiFiBytes = v20;
  v21 = self->_currentVPNInterfaceByteCounts.rxWiredBytes;
  v17 = v21 >= rxWiredBytes;
  v22 = v21 - rxWiredBytes;
  if (!v17)
    v22 = 0;
  self->_currentVPNInterfaceByteCounts.rxWiredBytes = v22;
  v23 = self->_currentVPNInterfaceByteCounts.txCellularBytes;
  v17 = v23 >= txCellularBytes;
  v24 = v23 - txCellularBytes;
  if (!v17)
    v24 = 0;
  self->_currentVPNInterfaceByteCounts.txCellularBytes = v24;
  v25 = self->_currentVPNInterfaceByteCounts.txWiFiBytes;
  v17 = v25 >= txWiFiBytes;
  v26 = v25 - txWiFiBytes;
  if (!v17)
    v26 = 0;
  self->_currentVPNInterfaceByteCounts.txWiFiBytes = v26;
  v27 = self->_currentVPNInterfaceByteCounts.txWiredBytes;
  v17 = v27 >= txWiredBytes;
  v28 = v27 - txWiredBytes;
  if (!v17)
    v28 = 0;
  self->_currentVPNInterfaceByteCounts.txWiredBytes = v28;
  v29 = (uint64_t *)objc_msgSend(v41, "_update_adjustment_bytes");
  v30 = *v29 + rxCellularBytes;
  if (__CFADD__(*v29, rxCellularBytes))
    v30 = -1;
  *v29 = v30;
  v31 = v29[1];
  v17 = __CFADD__(v31, rxWiFiBytes);
  v32 = v31 + rxWiFiBytes;
  if (v17)
    v32 = -1;
  v29[1] = v32;
  v33 = v29[2];
  v17 = __CFADD__(v33, rxWiredBytes);
  v34 = v33 + rxWiredBytes;
  if (v17)
    v34 = -1;
  v29[2] = v34;
  v35 = v29[3];
  v17 = __CFADD__(v35, txCellularBytes);
  v36 = v35 + txCellularBytes;
  if (v17)
    v36 = -1;
  v29[3] = v36;
  v37 = v29[4];
  v17 = __CFADD__(v37, txWiFiBytes);
  v38 = v37 + txWiFiBytes;
  if (v17)
    v38 = -1;
  v29[4] = v38;
  v39 = v29[5];
  v17 = __CFADD__(v39, txWiredBytes);
  v40 = v39 + txWiredBytes;
  if (v17)
    v40 = -1;
  v29[5] = v40;

}

@end
