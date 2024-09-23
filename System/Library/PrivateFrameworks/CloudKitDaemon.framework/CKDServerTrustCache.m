@implementation CKDServerTrustCache

+ (void)setValidatedTrusts:(id)a3
{
  objc_storeStrong((id *)&qword_1ED702818, a3);
}

+ (id)validatedTrusts
{
  return (id)qword_1ED702818;
}

+ (void)setFetchAttempt
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED702820;
  qword_1ED702820 = v3;

}

+ (BOOL)shouldRefetchTrusts
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  double v5;
  double v7;

  if (!qword_1ED702820)
    return 1;
  objc_msgSend_timeIntervalSinceNow((void *)qword_1ED702820, a2, v2);
  if (v5 < -1800.0)
    return 1;
  if (qword_1ED702818)
    return 0;
  objc_msgSend_timeIntervalSinceNow((void *)qword_1ED702820, v3, v4);
  return v7 < -1.0;
}

@end
