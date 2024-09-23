@implementation SocType

void __SocType_block_invoke()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  const void *v3;
  CFTypeID v4;
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  int v14;
  const UInt8 *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAB8], "IODeviceTree:/arm-io");
  if (!v0)
    return;
  v1 = v0;
  CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("compatible"), 0, 0);
  if (CFProperty)
  {
    v3 = CFProperty;
    v4 = CFGetTypeID(CFProperty);
    if (v4 != CFDataGetTypeID())
    {
LABEL_163:
      CFRelease(v3);
      goto LABEL_164;
    }
    Length = CFDataGetLength((CFDataRef)v3);
    BytePtr = CFDataGetBytePtr((CFDataRef)v3);
    v7 = BytePtr;
    if (Length < 13)
    {
      if (Length < 11 || *BytePtr != 97)
        goto LABEL_154;
    }
    else
    {
      if (*BytePtr != 97)
        goto LABEL_154;
      if (BytePtr[1] == 114)
      {
        if (BytePtr[2] == 109
          && BytePtr[3] == 45
          && BytePtr[4] == 105
          && BytePtr[5] == 111
          && BytePtr[6] == 44
          && BytePtr[7] == 115
          && BytePtr[8] == 53
          && BytePtr[9] == 108
          && BytePtr[10] == 56
          && BytePtr[11] == 57
          && BytePtr[12] == 52)
        {
          v8 = 244;
LABEL_162:
          SocType::soc_type = v8;
          goto LABEL_163;
        }
        if (BytePtr[2] == 109
          && BytePtr[3] == 45
          && BytePtr[4] == 105
          && BytePtr[5] == 111
          && BytePtr[6] == 44
          && BytePtr[7] == 115
          && BytePtr[8] == 53
          && BytePtr[9] == 108
          && BytePtr[10] == 56
          && BytePtr[11] == 57
          && BytePtr[12] == 53)
        {
          v8 = 245;
          goto LABEL_162;
        }
        if (BytePtr[2] == 109
          && BytePtr[3] == 45
          && BytePtr[4] == 105
          && BytePtr[5] == 111
          && BytePtr[6] == 44
          && BytePtr[7] == 115
          && BytePtr[8] == 53
          && BytePtr[9] == 108
          && BytePtr[10] == 56
          && BytePtr[11] == 57
          && BytePtr[12] == 54)
        {
          v8 = 246;
          goto LABEL_162;
        }
      }
    }
    if (BytePtr[1] == 114)
    {
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 55
        && BytePtr[9] == 48
        && BytePtr[10] == 48)
      {
        v8 = 247;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 115
        && BytePtr[8] == 56
        && BytePtr[9] == 48
        && BytePtr[10] == 48)
      {
        v8 = 248;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 48
        && BytePtr[10] == 49
        && BytePtr[11] - 48 < 3)
      {
        v8 = 249;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 48
        && BytePtr[10] == 49
        && BytePtr[11] == 53)
      {
        v8 = 250;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 48
        && BytePtr[10] == 50)
      {
        v9 = BytePtr[11];
        v8 = 251;
        if (v9 == 48 || v9 == 55)
          goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 48
        && BytePtr[10] == 51
        && BytePtr[11] == 48)
      {
        v8 = 252;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 49
        && BytePtr[10] == 48
        && (BytePtr[11] | 2) == 0x33)
      {
        v8 = 253;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 49
        && BytePtr[10] == 49
        && (BytePtr[11] | 2) == 0x32)
      {
        v8 = 254;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 49
        && BytePtr[10] == 50
        && (BytePtr[11] | 2) == 0x32)
      {
        v8 = 255;
        goto LABEL_162;
      }
      if (BytePtr[2] == 109
        && BytePtr[3] == 45
        && BytePtr[4] == 105
        && BytePtr[5] == 111
        && BytePtr[6] == 44
        && BytePtr[7] == 116
        && BytePtr[8] == 56
        && BytePtr[9] == 49
        && BytePtr[10] == 51
        && (BytePtr[11] | 2) == 0x32)
      {
LABEL_161:
        v8 = 256;
        goto LABEL_162;
      }
    }
LABEL_154:
    if (DeviceHasANE::onceToken != -1)
      dispatch_once(&DeviceHasANE::onceToken, &__block_literal_global_131);
    if (!DeviceHasANE::supportsANE)
      goto LABEL_163;
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315138;
        v15 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assuming H16, armio data: %s", (uint8_t *)&v14, 0xCu);
      }

    }
    goto LABEL_161;
  }
LABEL_164:
  IOObjectRelease(v1);
  if (SocType::soc_type == 240 && (int)MediaAnalysisLogLevel() >= 4)
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown device type; this may adversely impact capabilities & performance",
        (uint8_t *)&v14,
        2u);
    }

  }
}

@end
