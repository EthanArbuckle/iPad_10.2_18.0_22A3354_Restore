@implementation AXFallbackDeviceSizeMM

void __AXFallbackDeviceSizeMM_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  switch(MGGetSInt32Answer())
  {
    case 1u:
    case 2u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4049000000000000;
      v0 = 0x4052800000000000;
      goto LABEL_31;
    case 3u:
    case 4u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4068600000000000;
      v0 = 0x4062600000000000;
      goto LABEL_31;
    case 5u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4049000000000000;
      v0 = 0x4056800000000000;
      goto LABEL_31;
    case 6u:
    case 7u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4064000000000000;
      v1 = 0x405E000000000000;
      goto LABEL_6;
    case 8u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x404D800000000000;
      v0 = 0x405A400000000000;
      goto LABEL_31;
    case 9u:
    case 0xAu:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4051400000000000;
      v1 = 0x405F000000000000;
LABEL_6:
      v0 = v1;
      goto LABEL_31;
    case 0xBu:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4068800000000000;
      v0 = 0x4070400000000000;
      goto LABEL_31;
    case 0xCu:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x403C333333333333;
      v0 = 0x4041A66666666666;
      goto LABEL_31;
    case 0xDu:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x403899999999999ALL;
      v0 = 0x403ECCCCCCCCCCCDLL;
      goto LABEL_31;
    case 0xEu:
      v2 = (_QWORD *)&unk_1EE045000;
      v3 = 0x4065C00000000000;
      goto LABEL_20;
    case 0xFu:
    case 0x18u:
      goto LABEL_17;
    case 0x10u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x403B19999999999ALL;
      v0 = 0x4040F33333333333;
      goto LABEL_31;
    case 0x11u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x403F000000000000;
      v0 = 0x4043666666666666;
      goto LABEL_31;
    case 0x12u:
      if ((AXDeviceIsD32() & 1) != 0 || AXDeviceIsD42())
      {
LABEL_17:
        AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4051400000000000;
        v0 = 0x4060E00000000000;
LABEL_31:
        AXFallbackDeviceSizeMM_DeviceDimensions_1 = v0;
        return;
      }
      if ((AXDeviceIsD33() & 1) != 0 || AXDeviceIsD43())
      {
        AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4052800000000000;
        v0 = 0x4062C00000000000;
        goto LABEL_31;
      }
      return;
    case 0x13u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4051400000000000;
      v0 = 0x4062200000000000;
      goto LABEL_31;
    case 0x14u:
      v2 = &unk_1EE045000;
      v3 = 0x4064200000000000;
LABEL_20:
      v2[257] = v3;
      v0 = 0x406CC00000000000;
      goto LABEL_31;
    case 0x16u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x404D000000000000;
      v0 = 0x405F400000000000;
      goto LABEL_31;
    case 0x19u:
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = 0x4051C00000000000;
      v0 = 0x4063400000000000;
      goto LABEL_31;
    default:
      if (audit_stringSOS_block_invoke_twiceToken != -1)
        dispatch_once(&audit_stringSOS_block_invoke_twiceToken, &__block_literal_global_223_0);
      v0 = 0x4069666660000000;
      v4 = 0x40630CCCC0000000;
      v5 = MGGetProductType();
      if (v5 != 228444038 && v5 != 3645319985)
      {
        if (audit_stringSOS_block_invoke_onceToken2 != -1)
          dispatch_once(&audit_stringSOS_block_invoke_onceToken2, &__block_literal_global_225);
        v0 = 0x4052800000000000;
        v4 = 0x4049000000000000;
      }
      AXFallbackDeviceSizeMM_DeviceDimensions_0 = v4;
      goto LABEL_31;
  }
}

void __AXFallbackDeviceSizeMM_block_invoke_2()
{
  NSObject *v0;

  AXLogDisplay();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __AXFallbackDeviceSizeMM_block_invoke_2_cold_1();

}

void __AXFallbackDeviceSizeMM_block_invoke_224()
{
  NSObject *v0;

  AXLogDisplay();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __AXFallbackDeviceSizeMM_block_invoke_224_cold_1();

}

void __AXFallbackDeviceSizeMM_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C62B000, v0, v1, "AXDeviceSizeMM() screen class is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __AXFallbackDeviceSizeMM_block_invoke_224_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C62B000, v0, v1, "AXDeviceSizeMM() result is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
