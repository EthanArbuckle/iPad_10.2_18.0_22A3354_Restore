@implementation VCMediaDeviceErrorUtils

+ (id)mediaDeviceErrorEvent:(int64_t)a3 errorPath:(id)a4 returnCode:(int64_t)a5 reason:(id)a6
{
  if (a3 == 1)
    return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailedCode:returnCode:filePath:description:reason:", 32028, 1, a5, a4, CFSTR("Media device state transition failed"), a6);
  else
    return 0;
}

@end
