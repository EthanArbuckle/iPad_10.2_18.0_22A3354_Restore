@implementation NSFileHandle(HealthKit)

- (BOOL)hk_enumerateLinesWithError:()HealthKit handler:
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__NSFileHandle_HealthKit__hk_enumerateLinesWithError_handler___block_invoke;
  v5[3] = &unk_1E37F1320;
  v5[4] = a1;
  return +[HKLineEnumerator enumerateUTF8LinesWithError:dataProvider:lineHandler:](HKLineEnumerator, "enumerateUTF8LinesWithError:dataProvider:lineHandler:", a3, v5, a4);
}

@end
