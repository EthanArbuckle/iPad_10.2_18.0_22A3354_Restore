@implementation VCPVideoAnalyzer

+ (unint64_t)dependencies
{
  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[VCPVideoAnalyzer analyzeFrame:withTimestamp:andDuration:flags:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unimplemented method %s", (uint8_t *)&v7, 0xCu);
  }
  return -4;
}

- (int)finishAnalysisPass:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[VCPVideoAnalyzer finishAnalysisPass:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unimplemented method %s", (uint8_t *)&v4, 0xCu);
  }
  return -4;
}

- (id)results
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[VCPVideoAnalyzer results]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unimplemented method %s", (uint8_t *)&v3, 0xCu);
  }
  return 0;
}

@end
