@implementation MTRCommissionableBrowserResultInterfaces

- (Optional<chip::Dnssd::CommonResolutionData>)resolutionData
{
  uint64_t v2;
  _BOOL4 mHasValue;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  mHasValue = self->_resolutionData.mHasValue;
  *(_BYTE *)v2 = mHasValue;
  if (mHasValue)
  {
    *(_DWORD *)(v2 + 8) = self[1].super.isa;
    v4 = *(_OWORD *)&self[8]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 112) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 120);
    *(_OWORD *)(v2 + 128) = v4;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 144) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 152);
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 155) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 163);
    v5 = *(_OWORD *)&self[4]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 48) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 56);
    *(_OWORD *)(v2 + 64) = v5;
    v6 = *(_OWORD *)&self[6]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 80) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 88);
    *(_OWORD *)(v2 + 96) = v6;
    v7 = *(_OWORD *)&self[2]._resolutionData.mHasValue;
    *(MTRCommissionableBrowserResultInterfaces *)(v2 + 16) = *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 24);
    *(_OWORD *)(v2 + 32) = v7;
  }
  return (Optional<chip::Dnssd::CommonResolutionData>)self;
}

- (void)setResolutionData:(Optional<chip::Dnssd::CommonResolutionData>)a3
{
  int v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = **(unsigned __int8 **)&a3.mHasValue;
  self->_resolutionData.mHasValue = v3;
  if (v3)
  {
    LODWORD(self[1].super.isa) = *(_DWORD *)(*(_QWORD *)&a3.mHasValue + 8);
    v4 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 16);
    *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 40) = *(MTRCommissionableBrowserResultInterfaces *)(*(_QWORD *)&a3.mHasValue + 32);
    *(_OWORD *)&self[1]._resolutionData.mHasValue = v4;
    v5 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 48);
    v6 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 64);
    v7 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 80);
    *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 104) = *(MTRCommissionableBrowserResultInterfaces *)(*(_QWORD *)&a3.mHasValue + 96);
    *(_OWORD *)&self[5]._resolutionData.mHasValue = v7;
    *(_OWORD *)&self[4]._resolutionData.mHasValue = v6;
    *(_OWORD *)&self[3]._resolutionData.mHasValue = v5;
    v8 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 112);
    v9 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 128);
    v10 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 144);
    *(MTRCommissionableBrowserResultInterfaces *)((char *)self + 163) = *(MTRCommissionableBrowserResultInterfaces *)(*(_QWORD *)&a3.mHasValue + 155);
    *(_OWORD *)&self[9]._resolutionData.mHasValue = v10;
    *(_OWORD *)&self[8]._resolutionData.mHasValue = v9;
    *(_OWORD *)&self[7]._resolutionData.mHasValue = v8;
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  return self;
}

@end
