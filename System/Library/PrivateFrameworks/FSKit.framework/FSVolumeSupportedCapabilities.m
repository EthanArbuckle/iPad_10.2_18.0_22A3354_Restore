@implementation FSVolumeSupportedCapabilities

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[FSVolumeSupportedCapabilities capabilities](self, "capabilities"), CFSTR("FSKitSupportedCapabilities"));

}

- (FSVolumeSupportedCapabilities)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  int16x8_t v7;
  uint64x2_t v8;
  int16x8_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSVolumeSupportedCapabilities;
  v5 = -[FSVolumeSupportedCapabilities init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSKitSupportedCapabilities"));
    v5[8] = v6 & 1;
    v7.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(v6) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)(v5 + 9) = vmovn_s16(v7).u32[0];
    v5[14] = (v6 & 0x40) != 0;
    v5[15] = (v6 & 0x80) != 0;
    v5[28] = BYTE3(v6) & 1;
    v8 = (uint64x2_t)vdupq_n_s64(v6);
    *((int8x8_t *)v5 + 2) = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_23B2E00B0), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_23B2E00A0)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_23B2E00D0), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_23B2E00C0)))), (int8x8_t)0x101010101010101);
    v5[13] = (v6 & 0x20) != 0;
    v9 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_23B2E00F0), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_23B2E00E0));
    *(int8x8_t *)v9.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v9), (int8x8_t)0x1000100010001);
    *((_DWORD *)v5 + 6) = vmovn_s16(v9).u32[0];
  }

  return (FSVolumeSupportedCapabilities *)v5;
}

- (unint64_t)capabilities
{
  unint64_t supportsPersistentObjectIDs;

  supportsPersistentObjectIDs = self->_supportsPersistentObjectIDs;
  if (self->_supportsSymbolicLinks)
    supportsPersistentObjectIDs |= 2uLL;
  if (self->_supportsHardLinks)
    supportsPersistentObjectIDs |= 4uLL;
  if (self->_supportsJournal)
    supportsPersistentObjectIDs |= 8uLL;
  if (self->_supportsActiveJournal)
    supportsPersistentObjectIDs |= 0x10uLL;
  if (self->_supportsSparseFiles)
    supportsPersistentObjectIDs |= 0x40uLL;
  if (self->_supportsZeroRuns)
    supportsPersistentObjectIDs |= 0x80uLL;
  if (self->_supportsCaseSensitiveNames)
    supportsPersistentObjectIDs |= 0x100uLL;
  if (self->_supportsCasePreservingNames)
    supportsPersistentObjectIDs |= 0x200uLL;
  if (self->_supportsFastStatFS)
    supportsPersistentObjectIDs |= 0x400uLL;
  if (self->_supports2TBFiles)
    supportsPersistentObjectIDs |= 0x800uLL;
  if (self->_supportsOpenDenyModes)
    supportsPersistentObjectIDs |= 0x1000uLL;
  if (self->_supportsHiddenFiles)
    supportsPersistentObjectIDs |= 0x2000uLL;
  if (self->_supports64BitObjectIDs)
    supportsPersistentObjectIDs |= 0x20000uLL;
  if (self->_supportsDocumentID)
    supportsPersistentObjectIDs |= 0x80000uLL;
  if (self->_supportsSharedSpace)
    supportsPersistentObjectIDs |= 0x800000uLL;
  if (self->_supportsVolumeGroups)
    supportsPersistentObjectIDs |= 0x1000000uLL;
  if (self->_doesNotSupportVolumeSizes)
    supportsPersistentObjectIDs |= 0x8000uLL;
  if (self->_doesNotSupportRootTimes)
    supportsPersistentObjectIDs |= 0x20uLL;
  if (self->_doesNotSupportImmutableFiles)
    supportsPersistentObjectIDs |= 0x200000uLL;
  if (self->_doesNotSupportSettingFilePermissions)
    return supportsPersistentObjectIDs | 0x400000;
  else
    return supportsPersistentObjectIDs;
}

- (BOOL)isEqual:(id)a3
{
  FSVolumeSupportedCapabilities *v4;
  FSVolumeSupportedCapabilities *v5;
  FSVolumeSupportedCapabilities *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v29;

  v4 = (FSVolumeSupportedCapabilities *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v27) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[FSVolumeSupportedCapabilities supportsCasePreservingNames](self, "supportsCasePreservingNames");
    if (v7 != -[FSVolumeSupportedCapabilities supportsCasePreservingNames](v6, "supportsCasePreservingNames"))
      goto LABEL_24;
    v8 = -[FSVolumeSupportedCapabilities doesNotSupportRootTimes](self, "doesNotSupportRootTimes");
    if (v8 != -[FSVolumeSupportedCapabilities doesNotSupportRootTimes](v6, "doesNotSupportRootTimes"))
      goto LABEL_24;
    v9 = -[FSVolumeSupportedCapabilities doesNotSupportSettingFilePermissions](self, "doesNotSupportSettingFilePermissions");
    if (v9 != -[FSVolumeSupportedCapabilities doesNotSupportSettingFilePermissions](v6, "doesNotSupportSettingFilePermissions"))goto LABEL_24;
    v10 = -[FSVolumeSupportedCapabilities supportsSymbolicLinks](self, "supportsSymbolicLinks");
    if (v10 != -[FSVolumeSupportedCapabilities supportsSymbolicLinks](v6, "supportsSymbolicLinks"))
      goto LABEL_24;
    v11 = -[FSVolumeSupportedCapabilities supportsHardLinks](self, "supportsHardLinks");
    if (v11 != -[FSVolumeSupportedCapabilities supportsHardLinks](v6, "supportsHardLinks"))
      goto LABEL_24;
    v12 = -[FSVolumeSupportedCapabilities supports64BitObjectIDs](self, "supports64BitObjectIDs");
    if (v12 != -[FSVolumeSupportedCapabilities supports64BitObjectIDs](v6, "supports64BitObjectIDs"))
      goto LABEL_24;
    v13 = -[FSVolumeSupportedCapabilities supportsCaseSensitiveNames](self, "supportsCaseSensitiveNames");
    if (v13 != -[FSVolumeSupportedCapabilities supportsCaseSensitiveNames](v6, "supportsCaseSensitiveNames"))
      goto LABEL_24;
    v14 = -[FSVolumeSupportedCapabilities supportsDocumentID](self, "supportsDocumentID");
    if (v14 != -[FSVolumeSupportedCapabilities supportsDocumentID](v6, "supportsDocumentID"))
      goto LABEL_24;
    v15 = -[FSVolumeSupportedCapabilities supportsFastStatFS](self, "supportsFastStatFS");
    if (v15 != -[FSVolumeSupportedCapabilities supportsFastStatFS](v6, "supportsFastStatFS"))
      goto LABEL_24;
    v16 = -[FSVolumeSupportedCapabilities doesNotSupportImmutableFiles](self, "doesNotSupportImmutableFiles");
    if (v16 != -[FSVolumeSupportedCapabilities doesNotSupportImmutableFiles](v6, "doesNotSupportImmutableFiles"))
      goto LABEL_24;
    v17 = -[FSVolumeSupportedCapabilities supportsJournal](self, "supportsJournal");
    if (v17 != -[FSVolumeSupportedCapabilities supportsJournal](v6, "supportsJournal"))
      goto LABEL_24;
    v18 = -[FSVolumeSupportedCapabilities supportsActiveJournal](self, "supportsActiveJournal");
    if (v18 != -[FSVolumeSupportedCapabilities supportsActiveJournal](v6, "supportsActiveJournal"))
      goto LABEL_24;
    v19 = -[FSVolumeSupportedCapabilities supportsOpenDenyModes](self, "supportsOpenDenyModes");
    if (v19 != -[FSVolumeSupportedCapabilities supportsOpenDenyModes](v6, "supportsOpenDenyModes"))
      goto LABEL_24;
    v20 = -[FSVolumeSupportedCapabilities supportsPersistentObjectIDs](self, "supportsPersistentObjectIDs");
    if (v20 == -[FSVolumeSupportedCapabilities supportsPersistentObjectIDs](v6, "supportsPersistentObjectIDs")
      && (v21 = -[FSVolumeSupportedCapabilities supportsSharedSpace](self, "supportsSharedSpace"),
          v21 == -[FSVolumeSupportedCapabilities supportsSharedSpace](v6, "supportsSharedSpace"))
      && (v22 = -[FSVolumeSupportedCapabilities supportsSparseFiles](self, "supportsSparseFiles"),
          v22 == -[FSVolumeSupportedCapabilities supportsSparseFiles](v6, "supportsSparseFiles"))
      && (v23 = -[FSVolumeSupportedCapabilities supportsVolumeGroups](self, "supportsVolumeGroups"),
          v23 == -[FSVolumeSupportedCapabilities supportsVolumeGroups](v6, "supportsVolumeGroups"))
      && (v24 = -[FSVolumeSupportedCapabilities doesNotSupportVolumeSizes](self, "doesNotSupportVolumeSizes"),
          v24 == -[FSVolumeSupportedCapabilities doesNotSupportVolumeSizes](v6, "doesNotSupportVolumeSizes"))
      && (v25 = -[FSVolumeSupportedCapabilities supportsVolumeGroups](self, "supportsVolumeGroups"),
          v25 == -[FSVolumeSupportedCapabilities supportsVolumeGroups](v6, "supportsVolumeGroups"))
      && (v26 = -[FSVolumeSupportedCapabilities supportsZeroRuns](self, "supportsZeroRuns"),
          v26 == -[FSVolumeSupportedCapabilities supportsZeroRuns](v6, "supportsZeroRuns")))
    {
      v29 = -[FSVolumeSupportedCapabilities supports2TBFiles](self, "supports2TBFiles");
      v27 = v29 ^ -[FSVolumeSupportedCapabilities supports2TBFiles](v6, "supports2TBFiles") ^ 1;
    }
    else
    {
LABEL_24:
      LOBYTE(v27) = 0;
    }

  }
  else
  {
    LOBYTE(v27) = 0;
  }

  return v27;
}

- (BOOL)supportsPersistentObjectIDs
{
  return self->_supportsPersistentObjectIDs;
}

- (void)setSupportsPersistentObjectIDs:(BOOL)a3
{
  self->_supportsPersistentObjectIDs = a3;
}

- (BOOL)supportsSymbolicLinks
{
  return self->_supportsSymbolicLinks;
}

- (void)setSupportsSymbolicLinks:(BOOL)a3
{
  self->_supportsSymbolicLinks = a3;
}

- (BOOL)supportsHardLinks
{
  return self->_supportsHardLinks;
}

- (void)setSupportsHardLinks:(BOOL)a3
{
  self->_supportsHardLinks = a3;
}

- (BOOL)supportsJournal
{
  return self->_supportsJournal;
}

- (void)setSupportsJournal:(BOOL)a3
{
  self->_supportsJournal = a3;
}

- (BOOL)supportsActiveJournal
{
  return self->_supportsActiveJournal;
}

- (void)setSupportsActiveJournal:(BOOL)a3
{
  self->_supportsActiveJournal = a3;
}

- (BOOL)doesNotSupportRootTimes
{
  return self->_doesNotSupportRootTimes;
}

- (void)setDoesNotSupportRootTimes:(BOOL)a3
{
  self->_doesNotSupportRootTimes = a3;
}

- (BOOL)supportsSparseFiles
{
  return self->_supportsSparseFiles;
}

- (void)setSupportsSparseFiles:(BOOL)a3
{
  self->_supportsSparseFiles = a3;
}

- (BOOL)supportsZeroRuns
{
  return self->_supportsZeroRuns;
}

- (void)setSupportsZeroRuns:(BOOL)a3
{
  self->_supportsZeroRuns = a3;
}

- (BOOL)supportsCaseSensitiveNames
{
  return self->_supportsCaseSensitiveNames;
}

- (void)setSupportsCaseSensitiveNames:(BOOL)a3
{
  self->_supportsCaseSensitiveNames = a3;
}

- (BOOL)supportsCasePreservingNames
{
  return self->_supportsCasePreservingNames;
}

- (void)setSupportsCasePreservingNames:(BOOL)a3
{
  self->_supportsCasePreservingNames = a3;
}

- (BOOL)supportsFastStatFS
{
  return self->_supportsFastStatFS;
}

- (void)setSupportsFastStatFS:(BOOL)a3
{
  self->_supportsFastStatFS = a3;
}

- (BOOL)supports2TBFiles
{
  return self->_supports2TBFiles;
}

- (void)setSupports2TBFiles:(BOOL)a3
{
  self->_supports2TBFiles = a3;
}

- (BOOL)supportsOpenDenyModes
{
  return self->_supportsOpenDenyModes;
}

- (void)setSupportsOpenDenyModes:(BOOL)a3
{
  self->_supportsOpenDenyModes = a3;
}

- (BOOL)supportsHiddenFiles
{
  return self->_supportsHiddenFiles;
}

- (void)setSupportsHiddenFiles:(BOOL)a3
{
  self->_supportsHiddenFiles = a3;
}

- (BOOL)doesNotSupportVolumeSizes
{
  return self->_doesNotSupportVolumeSizes;
}

- (void)setDoesNotSupportVolumeSizes:(BOOL)a3
{
  self->_doesNotSupportVolumeSizes = a3;
}

- (BOOL)supports64BitObjectIDs
{
  return self->_supports64BitObjectIDs;
}

- (void)setSupports64BitObjectIDs:(BOOL)a3
{
  self->_supports64BitObjectIDs = a3;
}

- (BOOL)supportsDocumentID
{
  return self->_supportsDocumentID;
}

- (void)setSupportsDocumentID:(BOOL)a3
{
  self->_supportsDocumentID = a3;
}

- (BOOL)doesNotSupportImmutableFiles
{
  return self->_doesNotSupportImmutableFiles;
}

- (void)setDoesNotSupportImmutableFiles:(BOOL)a3
{
  self->_doesNotSupportImmutableFiles = a3;
}

- (BOOL)doesNotSupportSettingFilePermissions
{
  return self->_doesNotSupportSettingFilePermissions;
}

- (void)setDoesNotSupportSettingFilePermissions:(BOOL)a3
{
  self->_doesNotSupportSettingFilePermissions = a3;
}

- (BOOL)supportsSharedSpace
{
  return self->_supportsSharedSpace;
}

- (void)setSupportsSharedSpace:(BOOL)a3
{
  self->_supportsSharedSpace = a3;
}

- (BOOL)supportsVolumeGroups
{
  return self->_supportsVolumeGroups;
}

- (void)setSupportsVolumeGroups:(BOOL)a3
{
  self->_supportsVolumeGroups = a3;
}

@end
