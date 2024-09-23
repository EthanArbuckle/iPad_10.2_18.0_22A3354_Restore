@implementation NSUserActivity(CIBarcodeDescriptor)

- (uint64_t)detectedBarcodeDescriptor
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(a1, "_objectForIdentifier:", CFSTR("com.apple.DetectedBarcode.UserActivityPayload"));
  if (!result)
  {
    result = objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("com.apple.DetectedBarcode.UserActivityPayload"));
    if (result)
    {
      v3 = result;
      v4 = objc_opt_self();
      return unarchiveObjectOfClass(v4, v3);
    }
  }
  return result;
}

- (uint64_t)setDetectedCode:()CIBarcodeDescriptor
{
  uint64_t result;
  _QWORD v6[5];

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    if (a3)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __55__NSUserActivity_CIBarcodeDescriptor__setDetectedCode___block_invoke;
      v6[3] = &unk_1E2EC2D58;
      v6[4] = a3;
      return objc_msgSend(a1, "_setPayloadIdentifier:object:withBlock:", CFSTR("com.apple.DetectedBarcode.UserActivityPayload"), a3, v6);
    }
    else
    {
      return objc_msgSend(a1, "_setPayloadIdentifier:object:withBlock:", CFSTR("com.apple.DetectedBarcode.UserActivityPayload"), 0, 0);
    }
  }
  return result;
}

@end
